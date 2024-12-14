//
//  CarListItem.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 14/12/24.
//

import SwiftUI

struct CarListItem: View {
    var body: some View {
        HStack(spacing: 0) {
            
            Circle()
                .fill(Color.gray)
                .frame(width: 10, height: 10)
            
            Spacer()
                .frame(width: 8)
            
            Text("Nexia 2")
            Spacer()
            Text("01 A111 AA")
        }
        .font(.system(size: 14))
        .foregroundStyle(Color.text)
        .padding(.vertical, 2)
        .padding(.horizontal, 10)
    }
}

#Preview {
    CarListItem()
}
