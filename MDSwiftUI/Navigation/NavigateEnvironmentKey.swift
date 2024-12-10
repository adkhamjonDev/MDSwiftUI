//
//  NavigateEnvironmentKey.swift
//  MDSwiftUI
//
//  Created by Adkhamjon Rakhimov on 10/12/24.
//

import Foundation
import SwiftUICore


struct NavigateEnvironmentKey: EnvironmentKey {
    static var defaultValue: (Route) -> Void = { _ in }
}


extension EnvironmentValues {
    var navigate: (Route) -> Void {
        get{ self[NavigateEnvironmentKey.self] }
        set{ self[NavigateEnvironmentKey.self]  = newValue }
    }
}
