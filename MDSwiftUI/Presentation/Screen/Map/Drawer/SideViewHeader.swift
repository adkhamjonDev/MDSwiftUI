//
//  SideViewHeader.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import SwiftUI

struct SideViewHeader: View {
    let name: String
    var body: some View {
        VStack {
            
            HStack{
                VStack(alignment: .leading, spacing: 0) {
                    Image(ImageManager.instance.logo)
                        .resizable()
                        .frame(width: 90, height: 90)
                        .clipShape(.circle)
                    
                    Spacer()
                        .frame(height: 12)
                    
                    Text(name)
                        .font(.system(size: 14))
                        .font(.title)
                        .fontWeight(.bold)
                
                    
                    Text("Тошкент шахри")
                        .font(.system(size: 14))
                        .font(.title)
                        .fontWeight(.medium)
                    
                    HStack {
                        Text("Тошкент харбий округи - ")
                            .font(.system(size: 14))
                            .font(.title)
                            .fontWeight(.medium)
                        Spacer().frame(width: 4)
                        Text("123123")
                            .font(.system(size: 14))
                            .font(.title)
                            .fontWeight(.medium)
                    }
                    Spacer().frame(height: 6)
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                        
                    
                }
                .foregroundColor(Color.text)
                .padding(12)
                
                Spacer()
            }
        }
        .frame(width: 270)
        .background(Color.screenBackground)
        
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SideViewHeader(name: "Adkhamjon Rakhimov")
}
