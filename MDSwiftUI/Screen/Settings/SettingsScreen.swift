//
//  SettingsScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var languageDialog: Bool = false
    
    var body: some View {
        MainView {
            VStack(spacing: 0) {
                ToolBar(title: StringManager.instance.settings)
                VStack(spacing: 0) {
                    SettingsItem(
                        icon: ImageManager.instance.globe,
                        title: StringManager.instance.appLanguage
                    ){
                        languageDialog.toggle()
                    }
                    Divider()
                        .padding(.leading, 12)
                    SettingsItem(
                        icon: ImageManager.instance.moonStar,
                        title: StringManager.instance.mode,
                        isArrowVisibility: false
                    ) {
                        
                    }
                    Divider()
                        .padding(.leading, 12)
                    SettingsItem(
                        icon: ImageManager.instance.radiowaves,
                        title: StringManager.instance.mapRadius
                    ) {
                       
                    }
                }
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Spacer()
            }
            
            if languageDialog {
                LanguageDialog(isActive: $languageDialog, action: { languageCode in
                        
                    
                }, close: {
                    languageDialog.toggle()
                })
            }
        }
        .toolbarVisibility(.hidden)
    }
}


struct SettingsItem: View {
    let icon: String
    let title: String
    var isArrowVisibility: Bool = true
    
    let onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            
            HStack {
                Image(systemName: icon)
                    .frame(width: 24,height: 24)
                Spacer()
                    .frame(width: 8)
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.text)
                Spacer()
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.text)
                if isArrowVisibility {
                    Image(systemName: ImageManager.instance.arrowRight)
                        .foregroundColor(Color.gray)
                }
                
            }
            .padding(12)
            .background(Color.carView)
            
        }

    }
}
#Preview {
    SettingsScreen()
}

#Preview(traits: .sizeThatFitsLayout){
    SettingsItem(icon: ImageManager.instance.globe, title: StringManager.instance.appLanguage) {
        
    }
}
