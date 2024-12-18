//
//  CarListSection.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 14/12/24.
//

import SwiftUI

struct CarListSection: View {
    
    var onCarClick: () -> Void
    
    var body: some View {
        ZStack{
            
            Color.carView.opacity(0.6)
            
            
            VStack(spacing: 0) {
                
                carCountView
                Divider()
                    .frame(height: 1)
                    .background(Color.gray)
                ScrollView {
                    LazyVStack {
                        ForEach(0..<40) { index in
                            CarListItem()
                                .onTapGesture {
                                    onCarClick()
                                }
                        }
                    }
                }
                .clipped()
                .scrollIndicators(.hidden)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1)
                    
            }
        }
        
    }
}

extension CarListSection {
    private var carCountView: some View {
        HStack(spacing: 0) {
            VStack(alignment: .center, spacing: 0) {
                Text(StringManager.instance.all)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.grayy)
                Spacer()
                    .frame(height: 2)
                Text("40")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.text)
            }
            VStack(spacing: 0) {
                Text(StringManager.instance.moving)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.greenn)
                Spacer()
                    .frame(height: 2)
                Text("10")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.text)
            }
            .frame(maxWidth: .infinity)
            VStack(spacing: 0) {
                Text(StringManager.instance.offline)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.redd)
                Spacer()
                    .frame(height: 2)
                Text("30")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundStyle(Color.text)
            }
        }
        .padding(6)
    }

}

#Preview {
    CarListSection(onCarClick: {})
        .padding(16)
}
