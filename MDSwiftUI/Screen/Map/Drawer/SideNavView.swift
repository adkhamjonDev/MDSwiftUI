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
                // Dimmed background
                Rectangle()
                    .fill(Color.screenBackground)
                    .opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isShowingSideNav.toggle()
                        }
                    }
            }

            // Side Navigation View
            HStack {
                VStack(alignment: .leading) {
                    SideViewHeader(name: "Adkhamjon Rakhimov")
                    VStack {
                        SideViewButton(iconName: ImageManager.instance.map, title: StringManager.instance.map)
                            .onTapGesture {
                                mapClick()
                            }
                        Spacer().frame(height: 10)
                        SideViewButton(iconName: ImageManager.instance.settings, title: StringManager.instance.settings)
                            .onTapGesture {
                                settingsClick()
                            }
                        Spacer()
                        LogoutButton()
                            .onTapGesture {
                                logoutClick()
                            }
                        .padding(.bottom, 12)
                    }
                    .padding(.horizontal, 12)
                }
                .frame(width: 270, alignment: .leading)
                .background(Color.screenBackground)
                .offset(x: isShowingSideNav ? 0 : -300)
                .animation(.easeInOut(duration: 0.25), value: isShowingSideNav)

                Spacer()
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isShowingSideNav)
    }
}


#Preview {
    SideNavView(isShowingSideNav: .constant(true),mapClick: {},settingsClick: {},logoutClick: {})
        
}

