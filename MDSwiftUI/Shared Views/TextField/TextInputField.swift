//
//  TextInputField.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct TextInputField: View {
    let hint: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(hint)
                .font(.system(size: 14))
                .fontWeight(.medium)
                .padding(.horizontal, 16)
            
            Spacer()
                .frame(height: 6)
            TextField(hint, text: $text)
                .font(.system(size: 16))
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 16)
                .background(Color.carView)
                .cornerRadius(20)
                .foregroundColor(Color.text)
        }
    }
}

#Preview {
    TextInputField(hint: "Login", text: .constant(""))
}
