//
//  NetworkError.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 18/12/24.
//


enum NetworkError: Error {
    case noInternet
    case serverError
    case serverNotResponding
    case unauthorized
    case unknown
    case serialization
    case redirect
    case serverCustomError(message: String?)
}
