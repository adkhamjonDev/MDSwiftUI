//
//  MapDrawerMenuButton.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct MapDrawerMenuButton: View {
    
    let onClick: () -> Void
    
    var body: some View {
        Circle()
            .frame(width: 40, height: 40)
            .overlay {
                Image(ImageManager.instance.logo)
                    .resizable()
                    .clipped()
            }
            .onTapGesture {
                onClick()
            }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MapDrawerMenuButton {
        
    }
}
