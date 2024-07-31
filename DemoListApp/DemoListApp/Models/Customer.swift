//
//  Customer.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 30/07/2024.
//

import Foundation

struct Customer: Identifiable, Hashable {
    let id: UUID
    var firstName: String
    var lastName: String
    var email: String
    
    init(firstName: String, lastName: String, email: String) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
    
    init() {
        self.id = UUID()
        self.firstName = ""
        self.lastName = ""
        self.email = ""
    }
}
