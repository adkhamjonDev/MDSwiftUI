//
//  StringManager.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 07/12/24.
//
import Foundation



class StringManager {
    
    static let instance = StringManager()
    
    private init() {}
    
    
    let splashText = String(localized: "SplashText")
    let signIn = String(localized: "SignIn")
    let login = String(localized: "Login")
    let password = String(localized: "Password")
    let continuee = String(localized: "Continue")
    let map = String(localized: "Map")
    let settings = String(localized: "Settings")
    let logout = String(localized: "Logout")
}
