//
//  LoginScreenViewModel.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//

import Foundation
import Observation

@Observable
class LoginScreenViewModel {
    
    var isLoading: Bool = false
    var isUserLogged: Bool = false
    
    func userLogin() async throws {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.isLoading = false
            self.isUserLogged = true
        }
    }
}
