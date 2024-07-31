//
//  ValidationPreferennceKey.swift
//  DemoListApp
//
//  Created by Abdullah Al Dabbous on 31/07/2024.
//

import SwiftUI

struct ValidationPreferenceKey: PreferenceKey {    
    static var defaultValue: [String: Bool] = [:]
    
    static func reduce(value: inout [String : Bool], nextValue: () -> [String : Bool]) {
        value = nextValue()
    }
}
