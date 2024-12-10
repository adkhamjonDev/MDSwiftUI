//
//  MDSwiftUIApp.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

@main
struct MDSwiftUIApp: App {
    @State var languageSettings = LanguageSetting()
    
    @State private var routes: [Route] = []
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $routes){
                MapScreen()
                    .preferredColorScheme(.dark)
                    .environment(\.locale, languageSettings.locale)
                    .environment(\.navigate) { route in
                        routes.append(route)
                    }
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .login:
                            LoginScreen()
                        case .map:
                            MapScreen()
                        case .settings:
                            SettingsScreen()
                        }
                    }
            }
            
        }
    }
}
