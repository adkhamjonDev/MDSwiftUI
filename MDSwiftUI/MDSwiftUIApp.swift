//
//  MDSwiftUIApp.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct MDSwiftUIApp: App {
    @State var languageSettings = LanguageSetting()
    
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                MapScreen()
                    .preferredColorScheme(.dark)
                    .environment(\.locale, languageSettings.locale)
                    
            }
            
        }
    }
}
