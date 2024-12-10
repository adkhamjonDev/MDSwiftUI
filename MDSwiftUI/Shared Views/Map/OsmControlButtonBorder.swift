//
//  OsmControlButtonBorder.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct OsmControlButtonBorder: View {
    let imageName:String
    
    let onClick: () -> Void
    
    var body: some View {
        Circle()
            .fill(Color.carView.opacity(0.6))
            .frame(width: 40, height: 40)
            .overlay(
                Circle()
                    .stroke(Color.gray, lineWidth: 1)
            )
            .background(
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .padding(8)
            )
            .clipped()
            .onTapGesture {
                onClick()
            }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OsmControlButtonBorder(imageName: "location") {
        
    }
}
