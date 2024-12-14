//
//  SelectRadiusDialog.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 13/12/24.
//

import SwiftUI
import SwiftUIFlow

private let visibilityRadiusList: [Int] = [
    5,10,15,20,25,30,35,40,45,50
]


struct SelectRadiusDialog: View {
    
    let action: (Int) -> ()
    let close: () -> ()
    @State private var offset: CGFloat = 1000
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(StringManager.instance.mapRadius)
                    Spacer()
                    Button {
                        close()
                    } label: {
                        Image(systemName: ImageManager.instance.xmark)
                            .foregroundColor(Color.text)
                    }
                }
                .padding(14)
                
                Flow(.vertical, alignment: .center) {
                    ForEach(visibilityRadiusList) { radius in
                        RadiusItem(radius: radius)
                            .onTapGesture {
                                action(radius)
                            }
                    }
                }
                .padding(.horizontal, 10)
                
                MainButton(title: StringManager.instance.save, isEnabled: .constant(true)) {
                    
                }
                .padding(14)
                
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            .background(Color.carView)
            .cornerRadius(8)
            .shadow(radius: 20)
            .offset(x: 0, y: offset)
            .onAppear {
                withAnimation(.spring(duration: 0.2)) {
                    offset = 0
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct RadiusItem: View {
    let radius: Int
    var body: some View {
        
        
        Text("\(radius) KM")
            .font(.system(size: 16))
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.carView)
            .overlay(
                Capsule()
                    .stroke(Color.gray, lineWidth: 1) // Add stroke with desired color and width
            )
            .clipShape(.capsule)
    }
}

#Preview {
    SelectRadiusDialog { int in
        
    } close: {
        
    }
    
}
#Preview(traits: .sizeThatFitsLayout) {
    RadiusItem(radius: 45)
        .colorScheme(.dark)
}
