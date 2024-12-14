//
//  SettingsScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    @State private var languageDialog: Bool = false
    @State private var selectRadiusDialog: Bool = false
    @State private var toggle: Bool = false
    var body: some View {
        MainView {
            VStack(spacing: 0) {
                ToolBar(title: StringManager.instance.settings)
                VStack(spacing: 0) {
                    SettingsItem(
                        icon: ImageManager.instance.globe,
                        title: StringManager.instance.appLanguage,
                        description: StringManager.instance.appLanguage
                    ){
                        languageDialog.toggle()
                    }
                    Divider()
                        .padding(.leading, 12)
                    
                    switchMode
                    
                   
                    Divider()
                        .padding(.leading, 12)
                    SettingsItem(
                        icon: ImageManager.instance.radiowaves,
                        title: StringManager.instance.mapRadius,
                        description: StringManager.instance.mapRadius
                    ) {
                        selectRadiusDialog.toggle()
                    }
                    
                    Divider()
                        .padding(.leading, 12)
                    
                    appVersion
                   
                    
                }
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .padding(.top, 16)
                
                Spacer()
            }
            
            if languageDialog {
                LanguageDialog(action: { languageCode in
                        
                    
                }, close: {
                    languageDialog.toggle()
                })
            }
            if selectRadiusDialog {
                SelectRadiusDialog(action: { radius in
                        
                    
                }, close: {
                    selectRadiusDialog.toggle()
                })
            }
        }
        .toolbarVisibility(.hidden)
    }
}


extension SettingsScreen {
    
    private var switchMode: some View {
        Toggle(isOn: $toggle) {
            HStack {
                Image(systemName: ImageManager.instance.moonStar)
                    .frame(width: 24,height: 24)
                    .foregroundStyle(Color.main)
                
                
                Spacer()
                    .frame(width: 8)
                Text(StringManager.instance.mode)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.text)
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .toggleStyle(SwitchToggleStyle(tint: Color.main))
        .background(Color.carView)
    }
    
    private var appVersion: some View {
        HStack {
            
            Text(StringManager.instance.mapRadius)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color.text)
            Spacer()
            Text(StringManager.instance.mapRadius)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color.text)
            
        }
        .padding(12)
        .background(Color.carView)
    }
}


struct SettingsItem: View {
    let icon: String
    let title: String
    let description: String
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
    SettingsItem(icon: ImageManager.instance.globe, title: StringManager.instance.appLanguage, description: StringManager.instance.appLanguage) {
        
    }
}
