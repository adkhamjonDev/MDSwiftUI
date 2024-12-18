//
//  LogoutButton.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct LogoutButton: View {
    var body: some View {
        HStack {
            Text(StringManager.instance.logout)
                .font(.system(size: 12))
                .font(.headline)
                .fontWeight(.medium)
        }
        .foregroundColor(Color.white)
        .frame(height: 34)
        .frame(maxWidth: .infinity)
        .background(Color.redd)
        .cornerRadius(17)
    }
}

#Preview {
    LogoutButton()
}
