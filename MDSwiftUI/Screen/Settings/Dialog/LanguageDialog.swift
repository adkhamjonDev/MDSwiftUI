//
//  LanguageDialog.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 12/12/24.
//

import SwiftUI


struct LanguageModel: Hashable {
    let language:String
    let languageCode: String
}

struct LanguageDialog: View {
    
    
    @Binding var isActive: Bool
    @State private var offset: CGFloat = 1000
    
    private let languagelList:[LanguageModel] = [
        LanguageModel(language: StringManager.instance.uzbek, languageCode: StringManager.instance.uzbek),
        LanguageModel(language: StringManager.instance.cyrillic, languageCode: StringManager.instance.cyrillic),
        LanguageModel(language: StringManager.instance.russian, languageCode: StringManager.instance.russian)
    ]
    
    let action: (String) -> ()
    let close: () -> ()
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.3)
                .onTapGesture {
                    close()
                }
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(StringManager.instance.appLanguage)
                    Spacer()
                    Button {
                        close()
                    } label: {
                        Image(systemName: ImageManager.instance.xmark)
                            .foregroundColor(Color.text)
                    }
                }
                .padding(14)
                ForEach(languagelList, id: \.self) { language in
                    
                    VStack(spacing: 0) {
                        Button {
                            action(language.languageCode)
                        } label: {
                            Text(language.language)
                                .frame(maxWidth: .infinity)
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 12)
                                .foregroundStyle(Color.text)
                                
                        }
                        .frame(maxWidth: .infinity)
                        if language != languagelList.last {
                            Divider()
                                .padding(.horizontal, 12)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width * 0.55)
            .background(Color.carView)
            .clipShape(RoundedRectangle(cornerRadius: 8))
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

#Preview {
    LanguageDialog(isActive: .constant(true),action: {_ in },close: {})
}
