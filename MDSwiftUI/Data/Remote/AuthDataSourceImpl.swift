//
//  AuthDataSourceImpl.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//

import Foundation

class AuthDataSourceImpl: AuthDataSource {
    func login(_ username: String, _ passworde: String) async -> Result<ProfileModel, NetworkError> {
        return .failure(.noInternet)
    }
    
    
}
