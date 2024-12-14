//
//  SideViewButton.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct SideViewButton: View {
    
    let iconName: String
    let title: String
    
    var body: some View {
        HStack {
            Spacer().frame(width: 16)
            Image(systemName: iconName)
                .resizable()
                .frame(width: 20, height: 20)
            Spacer().frame(width: 8)
            Text(title)
                .font(.system(size: 12))
                .font(.headline)
                .fontWeight(.medium)
            Spacer()
        }
        .foregroundColor(Color.white)
        .frame(height: 34)
        .frame(maxWidth: .infinity)
        .background(Color.carView)
        .cornerRadius(17)
       
        
        
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SideViewButton(iconName: ImageManager.instance.settings,title: StringManager.instance.settings)
}
