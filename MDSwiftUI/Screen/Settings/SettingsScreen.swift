//
//  SettingsScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct SettingsScreen: View {
    
    let menuOptions: [String] = [
        "Илова тили",
        "Мавзу",
        "Автотранспорт куриниш радиуси",
        "Илова версияси"
    ]
    var body: some View {
        MainView {
            VStack {
                VStack(spacing: 0) {
                    SettingsItem(icon: "globe", title: "Илова номи")
                    SettingsItem(icon: "globe", title: "Мавзу")
                    SettingsItem(icon: "globe", title: "Автотранспорт куриниш радиуси")
                }
                .cornerRadius(8)
                .padding()
                
                Spacer()
            }
            

        }
    }
}


struct SettingsItem: View {
    let icon: String
    let title: String
    var body: some View {
        Button {
            
        } label: {
            
            HStack {
                Image(systemName: "person.fill")
                    .frame(width: 24,height: 24)
                Spacer()
                    .frame(width: 8)
                Text(title)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(Color.text)
                Spacer()
                Image(systemName: "arrow.right")
                    .foregroundColor(Color.gray)
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
    SettingsItem(icon: "globe", title: "Network")
}
