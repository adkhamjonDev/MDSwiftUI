//
//  MainView.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI

struct MainStack<Content: View>: View {
    let content: Content
    var isLoading: Bool = false
    init(isLoading: Bool = false,@ViewBuilder content: () -> Content) {
        self.isLoading = isLoading
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            
            Color.screenBackground
            ZStack {
                content
                if isLoading {
                    ZStack(alignment: .center) {
                        Color.screenBackground.opacity(0.6)
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.hideKeyboard()
        }
    }
}

#Preview {
    MainStack(isLoading: false, content: {
        
    }
    )
}
