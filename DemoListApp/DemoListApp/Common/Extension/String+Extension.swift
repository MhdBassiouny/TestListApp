//
//  String+Extension.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 30/07/2024.
//

import Foundation

extension String {
    var isValidName: Bool {
        let nameRegex = "^[a-zA-Z0-9\\u0600-\\u06FF\\u0621-\\u064A\\s]*$"
        return self.matchRegex(regex: nameRegex)
    }
    
    var validateEmail: Bool {
        let regex = "^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$"
        return self.matchRegex(regex: regex)
    }
    
    func matchRegex(regex: String ) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}
