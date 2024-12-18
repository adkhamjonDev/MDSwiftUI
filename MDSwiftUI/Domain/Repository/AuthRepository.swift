//
//  AuthRepository.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//

protocol AuthRepository {
    
    func login(_ username: String, _ password: String) async -> Result<ProfileModel, NetworkError>
}
