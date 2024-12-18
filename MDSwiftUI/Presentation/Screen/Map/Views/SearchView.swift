//
//  SearchView.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 14/12/24.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchText: String = ""
    @State private var isSearching = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            // initial search icon will be visible
            // when search will be clicked it should open text field with animation to infinity size 
            Circle()
                .fill(.clear)
                .frame(width: 40, height: 40)
                .background {
                    Image(systemName: ImageManager.instance.search)
                        .foregroundStyle(Color.white.opacity(0.6))
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isSearching.toggle()
                    }
                }
            
            if isSearching {
                TextField(StringManager.instance.signIn, text: $searchText)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .trailing).combined(with: .opacity))
            }
            if isSearching {
                Image(systemName: ImageManager.instance.xmark)
                    .foregroundStyle(Color.white.opacity(0.6))
                    .padding(.trailing, 16)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            isSearching.toggle()
                        }
                    }
            }
            
        }
        .background(Color.carView.opacity(0.6))
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .stroke(Color.gray,lineWidth: 1)
        }
        
        
    }
}

#Preview {
    SearchView()
}
