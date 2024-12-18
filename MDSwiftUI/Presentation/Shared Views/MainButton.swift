//
//  MainButton.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct MainButton: View {
    let title: String
    @Binding var isEnabled: Bool
    var onClick: () -> Void
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .font(.headline)
                .foregroundColor(isEnabled ? Color.white : Color.disabledButtonText)
                .background(isEnabled ? Color.main : Color.disableButton)
                .cornerRadius(20)
        }
        .disabled(!isEnabled)

    }
}

#Preview {
    MainButton(
        title: "Next",
        isEnabled: .constant(false)) {
            
        }
}
