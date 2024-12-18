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
    let yes = String(localized: "Yes")
    let no = String(localized: "No")
    let mode = String(localized: "Mode")
    let appLanguage = String(localized: "AppLanguage")
    let mapRadius = String(localized: "MapRadius")
    
    let uzbek = String(localized: "Uzbek")
    let russian = String(localized: "Russian")
    let cyrillic = String(localized: "Cyrillic")
    let save = String(localized: "Save")
    let all = String(localized: "All")
    let moving = String(localized: "Moving")
    let offline = String(localized: "Offline")
}
