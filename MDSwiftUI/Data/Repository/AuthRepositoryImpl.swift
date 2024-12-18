//
//  AuthRepositoryImpl.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//

import Foundation

class AuthRepositoryImpl : AuthRepository {
    
    func login(_ username: String, _ password: String) async -> Result<ProfileModel, NetworkError> {
        return .failure(.noInternet)
    }
    
    
}
