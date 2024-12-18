//
//  MapScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI
import MapKit
import SwiftfulRouting


struct MapScreen: View {
    
    @Environment(\.router) var router
    
    
    @StateObject private var mapController = MapController()
    
    @State var presentSideMenu: Bool = false
    @State var isLogoutAlert: Bool = false
    @State var carListView: Bool = true
    
    var body: some View {
        MainStack {
            OSMMapView(mapController: mapController)
            GeometryReader { geo in
                HStack(spacing: 0) {
                    mapContentView
                    Spacer()
                    if carListView {
                        
                        Image(ImageManager.instance.halfCircle)
                            .resizable()
                            .foregroundStyle(Color.main.opacity(0.6))
                            .frame(width: 20, height: 40)
                            .overlay(
                                Image(systemName: ImageManager.instance.arrowRight)
                                    .foregroundStyle(Color.white.opacity(0.6))
                            )
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.3)) {
                                    carListView = false
                                }
                            }
                        
                        CarListSection {
                            
                        }
                        .frame(width: geo.size.width * 0.34)
                        .offset(x: carListView ? 0 : geo.size.width * 0.34) // Slide fully off-screen
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                        .gesture(
                            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onEnded { value in
                                    if value.translation.width > 50 { // Swipe right
                                        withAnimation(.easeInOut(duration: 0.3)) {
                                            carListView = false // Open sidebar
                                        }
                                    }
                                }
                        )
                        
                        
                    } else {
                        Rectangle()
                            .fill(Color.main)
                            .frame(width: geo.size.width * 0.01, height: geo.size.width * 0.5)
                            .clipShape(
                                RoundedCorners(topLeft: 20, topRight: 0, bottomLeft: 20, bottomRight: 0)
                            )
                            .gesture(
                                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                    .onEnded { value in
                                        if value.translation.width < 50 {
                                            withAnimation(.easeInOut(duration: 0.5)) {
                                                carListView = true
                                            }
                                        }
                                    }
                            )
                    }
                    
                }
            }
            sideBarView
        }
        .toolbarVisibility(.hidden)
        .alert(isPresented: $isLogoutAlert) {
            logoutAlert()
        }
    }
    
    
    func toogleAlert() {
        isLogoutAlert.toggle()
    }
    
    func logoutAlert() -> Alert {
        return Alert(
            title: Text(StringManager.instance.logout),
            message: Text(StringManager.instance.logout),
            primaryButton: .default(
                Text(StringManager.instance.no)
                    .foregroundStyle(Color.text),
                action: toogleAlert
            ),
            secondaryButton: .default(
                Text(StringManager.instance.yes)
                    .foregroundStyle(Color.text),
                action: {
                    router.showScreen(.push) { _ in
                        LoginScreen()
                    }
                    router.dismissScreenStack()
                }
            )
        )
    }
    
}

extension MapScreen {
    private var mapKitView: some View {
        ZStack {
            
        }
    }
    private func navigateToSettingScreen() {
        router.showScreen(.push) { _ in
            
            SettingsScreen()
            
        }
    }
    
    private var sideBarView : some View {
        SideNavView(
            isShowingSideNav: $presentSideMenu,
            mapClick: {},
            settingsClick: {
                presentSideMenu.toggle()
                navigateToSettingScreen()
            },
            logoutClick: {
                presentSideMenu.toggle()
                isLogoutAlert.toggle()
            }
        )
    }
    
    private var mapContentView : some View {
        HStack {
            VStack(alignment: .leading) {
                HStack(spacing: 0) {
                    MapDrawerMenuButton {
                        
                        presentSideMenu.toggle()
                        
                    }
                    Spacer()
                        .frame(width: 8)
                    SearchView()
                    
                    
                }
                
                Spacer()
                
                OsmControlButton(imageName: ImageManager.instance.osmZoomIn) {
                    mapController.zoomIn()
                }
                
                OsmControlButton(imageName: ImageManager.instance.osmZoomOut) {
                    mapController.zoomOut()
                }
                
                Spacer()
                
                OsmControlButtonBorder(imageName: ImageManager.instance.currentLocation) {
                    
                }
            }
            Spacer()
        }
        .padding(6)
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
