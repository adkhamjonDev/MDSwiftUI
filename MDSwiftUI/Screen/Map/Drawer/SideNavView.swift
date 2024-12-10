//
//  SideNavView.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//
import SwiftUI

struct SideNavView: View {
    @Binding var isShowingSideNav: Bool
    
    let mapClick: () -> Void
    let settingsClick: () -> Void
    let logoutClick: () -> Void
    
    var body: some View {
        ZStack {
            
            if isShowingSideNav {
                Rectangle()
                    .fill(Color.screenBackground)
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isShowingSideNav.toggle()
                        }
                    }
                
                HStack {
                    VStack(alignment: .leading) {
                        SideViewHeader(name: "Adkhamjon Rakhimov")
                        VStack {
                            SideViewButton(iconName: ImageManager.instance.map, title: StringManager.instance.map){
                                mapClick()
                            }
                            Spacer().frame(height: 10)
                            SideViewButton(iconName: ImageManager.instance.settings, title: StringManager.instance.settings){
                                settingsClick()
                            }
                            Spacer()
                            LogoutButton(onClick: {
                                logoutClick()
                            })
                                .padding(.bottom, 12)
                        }
                        .padding(.horizontal, 12)
                        
                    }
                    .frame(width: 270, alignment: .leading)
                    .background(Color.screenBackground)
                    
                    
                    Spacer()
                    
                   
                }
                
            }
            
        }
        
    }
}

#Preview {
    SideNavView(isShowingSideNav: .constant(true),mapClick: {},settingsClick: {},logoutClick: {})
}

