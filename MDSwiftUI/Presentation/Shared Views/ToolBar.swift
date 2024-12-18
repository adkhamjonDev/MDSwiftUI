//
//  ToolBar.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 12/12/24.
//

import SwiftUI

struct ToolBar: View {
    @Environment(\.router) var router

    let title:String
    var body: some View {
        HStack(spacing: 0) {
            
            Circle()
                .fill(.clear)
                .frame(width: 40, height: 40)
                .overlay {
                    Image(systemName: ImageManager.instance.arrowLeft)
                }
                .onTapGesture {
                    router.dismissScreen()
                }
            
            Spacer()
            Text(title)
                .font(.system(size: 14))
                .font(.title)
            Spacer()
        }
        .background(Color.carView)
        .frame(height: 44)
        .frame(maxWidth: .infinity)
        .foregroundColor(Color.text)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ToolBar(title: StringManager.instance.settings)
}
