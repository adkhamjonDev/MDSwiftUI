//
//  ProfileModel.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//


struct ProfileModel: Identifiable {
    let id: Int
    let fullNam: String
    let photo: String
    let region: String
    let workplace: String
    let role: Role = .ADMIN
}

enum Role {
    case ADMIN
    case VAI
    case MEDIC
    case TECHNICIAN
}
