//
//  FormInputField.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 31/07/2024.
//

import SwiftUI

public enum FormInputFields: String, InputField {
    case firstName, lastName, email
    
    public var inputType: UIKeyboardType {
        switch self {
        case .firstName, .lastName: .default
        case .email: .emailAddress
        }
    }
    
    public var placeHolder: String {
        switch self {
        case .firstName: "First Name * "
        case .lastName: "Last Name *"
        case .email: "Email"
        }
    }
    
    public var errorMessage: String {
        switch self {
        case .firstName: "First Name is required"
        case .lastName: "Last Name is required"
        case .email: "Please Enter a correct Email"
        }
    }
    
    public var systemImage: String? {
        switch self {
        case .firstName, .lastName: "person"
        case .email: "envelope"
        }
    }
    
    public var isValidInput: Bool {
        switch self {
        case .firstName, .lastName: false
        default: true
        }
    }
    
    public func isValid(text: String) -> Bool {
        switch self {
        case .firstName: text.isValidName
        case .lastName: text.isValidName
        case .email: text.validateEmail
        }
    }
}
