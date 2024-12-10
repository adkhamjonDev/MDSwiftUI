//
//  MapViewControllerButton.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct OsmControlButton: View {
    
    let imageName:String
    
    let onClick: () -> Void
    
    var body: some View {
        Circle()
            .fill(Color.main.opacity(0.6))
            .frame(width: 40, height: 40)
            .background {
                Image(systemName: imageName)
                    .foregroundColor(.white)
            }
            .onTapGesture {
                onClick()
            }
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    OsmControlButton(imageName: "plus"){
        
    }
}
