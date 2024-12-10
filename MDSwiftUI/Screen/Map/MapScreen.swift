//
//  MapScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI
import MapKit

struct MapScreen: View {
    @StateObject private var mapController = MapController()
    @State var presentSideMenu: Bool = false
    @Environment(\.navigate) private var navigator
    @State private var logoutAlert: Bool = false
    var body: some View {
        MainView{
            OSMMapView(mapController: mapController)
            HStack {
                VStack {
                    MapDrawerMenuButton{
                        presentSideMenu.toggle()
                    }
                    Spacer()
                    
                    OsmControlButton(imageName: ImageManager.instance.osmZoomIn) {
                        
                    }
                    OsmControlButton(imageName: ImageManager.instance.osmZoomOut) {
                        
                    }
                    Spacer()
                    
                    OsmControlButtonBorder(imageName: ImageManager.instance.currentLocation) {
                        
                    }
                }
                Spacer()
            }
            .padding(6)
            
            SideNavView(
                isShowingSideNav: $presentSideMenu,
                mapClick: {
                    navigator(.map)
                },
                settingsClick: {
                    navigator(.settings)
                },
                logoutClick: {
                    logoutAlert.toggle()
                    presentSideMenu.toggle()
                }
            )
                .transition(.move(edge: .leading))
                .animation(.easeInOut(duration: 0.5), value: presentSideMenu)


            
        }
        .ignoresSafeArea()
        .toolbarVisibility(.hidden)
        .alert(isPresented: $logoutAlert) {
            Alert(
                title: Text(StringManager.instance.logout),
                message: Text(StringManager.instance.logout),
                primaryButton: .default(Text("Ҳа")
                    .foregroundColor(Color.text), action: {
                        navigator(.login)
                }),
                secondaryButton: .cancel(Text("Йўқ").foregroundColor(Color.text), action: {})
                
            )
        }
        
        
    }
}

extension MapScreen {
    private var mapKitView: some View {
        ZStack {
            
        }
    }
}

struct OSMMapView: UIViewRepresentable {
    @ObservedObject var mapController: MapController
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        // Provide mapView to the controller
        mapController.setMapView(mapView)
        
        // Add OpenStreetMap tile overlay
        let template = "http://192.168.102.191/main/{z}/{x}/{y}.png"
        let overlay = MKTileOverlay(urlTemplate: template)
        overlay.canReplaceMapContent = true
        mapView.addOverlay(overlay, level: .aboveLabels)
        
        // Set initial region
        let initialRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.863426, longitude: 64.722814),
            span: MKCoordinateSpan(latitudeDelta: 15, longitudeDelta: 15)
        )
        mapView.setRegion(initialRegion, animated: false)
        
        // Set min and max zoom levels
        let minZoomAltitude: CLLocationDistance = 5000 // Maximum zoom in
        let maxZoomAltitude: CLLocationDistance = 1500000 // Maximum zoom out
        
        mapView.cameraBoundary = MKMapView.CameraBoundary(
            mapRect: MKMapRect.world // Restrict zooming outside the world map
        )
        
        mapView.cameraZoomRange = MKMapView.CameraZoomRange(
            minCenterCoordinateDistance: minZoomAltitude,
            maxCenterCoordinateDistance: maxZoomAltitude
        )
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // Update the map view if needed
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let tileOverlay = overlay as? MKTileOverlay {
                return MKTileOverlayRenderer(tileOverlay: tileOverlay)
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}


#Preview {
    MapScreen()
}
