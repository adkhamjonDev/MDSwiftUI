//
//  AuthDataSource.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//

protocol AuthDataSource {
    func login(_ username: String, _ passworde: String) async -> Result<ProfileModel, NetworkError>

}
