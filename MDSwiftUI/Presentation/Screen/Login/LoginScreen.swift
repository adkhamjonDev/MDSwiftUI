//
//  LoginScreen.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import SwiftUI
import SwiftfulRouting

struct LoginScreen: View {
    
    @State private var viewModel = LoginScreenViewModel()
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Environment(\.router) var router

    var isButtonEnabled: Bool {
        !username.isEmpty && !password.isEmpty
    }
    var body: some View {
        MainStack(isLoading: viewModel.isLoading){
            GeometryReader { geo in
                HStack(spacing: 0) {
                    imageTitleSection
                        .frame(width: geo.size.width * 0.5)
                    
                    
                    loginInputSection
                        .padding(.trailing, (geo.size.width * 0.5) / 7)
                        .frame(width: geo.size.width * 0.5)
                }
            }
            
            
        }
        .toolbarVisibility(.hidden)
    }
    private func clearFields() {
        username = ""
        password = ""
    }
}

extension LoginScreen {
    private var imageTitleSection: some View {
        VStack(alignment: .center) {
            Image(ImageManager.instance.logo)
                .resizable()
                .frame(width: 220, height: 220)
            Spacer()
                .frame(height: 10)
            Text(StringManager.instance.splashText)
                .foregroundColor(.text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
    
    private var loginInputSection: some View {
        VStack(alignment: .center) {
            Text(StringManager.instance.signIn)
                .foregroundColor(.text)
                .font(.title)
                .fontWeight(.medium)
            
            Spacer()
                .frame(height: 24)
            
            TextInputField(hint: StringManager.instance.login, text: $username)
            
            Spacer()
                .frame(height: 10)
            
            SecureInputField(hint: StringManager.instance.password, text: $password)
            
            Spacer()
                .frame(height: 16)
            
            
            MainButton(
                title: StringManager.instance.continuee,
                isEnabled: .constant(isButtonEnabled)
            ){
                clearFields()
                router.showScreen(.push) { _ in
                    MapScreen()
                }
               
            }
            
            
        }
    }
}


#Preview() {
    LoginScreen()
        .environment(\.locale, LanguageSetting().locale)
}
