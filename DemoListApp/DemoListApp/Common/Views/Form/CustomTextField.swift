//
//  CustomTextField.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 1/8/24.
//

import SwiftUI

protocol InputField: Hashable {
    var inputType: UIKeyboardType { get }
    var placeHolder: String { get }
    var errorMessage: String { get }
    var systemImage: String? { get }
    var rawValue: String { get }
    
    func isValid(text: String) -> Bool
}

struct CustomTextField<T: InputField>: View {
    var fieldType: T
    @Binding var text: String
    @Binding var startEditing: Bool?
    @State var isValid: Bool = true
    var isRequired: Bool

    
    init(fieldType: T, text: Binding<String>, startEditing: Binding<Bool?> = .constant(nil), isRequired: Bool = false) {
        self.fieldType = fieldType
        self._text = text
        self._startEditing = startEditing
        self.isRequired = isRequired
    }
    
    var body: some View {
        HStack {
            if let systemImage = fieldType.systemImage {
                Image(systemName: systemImage)
            }
            
            TextField(fieldType.placeHolder, text: $text)
                .keyboardType(fieldType.inputType)
                .foregroundColor(isValid ? .primary : .red)
                .onChange(of: text) {
                    if startEditing == false {
                        startEditing = true
                    }
                    validateField()
                }
                .preference(
                    key: ValidationPreferenceKey.self,
                    value: [fieldType.rawValue: isValid]
                )
        }
        .onAppear {
            validateField()
        }
        .padding(.vertical, 10)
        .overlay(alignment: .topLeading) {
            overlay
        }
    }
    
    private func validateField() {
        if isRequired {
            isValid = fieldType.isValid(text: text) && !text.isEmpty
        } else {
            if !text.isEmpty {
                isValid = fieldType.isValid(text: text)
            } else {
                isValid = true
            }
        }
    }
    
    private var overlay: some View {
        Text((text.isEmpty && (startEditing != true || !isRequired)) ? "" : (isValid ? fieldType.placeHolder : fieldType.errorMessage))
            .lineLimit(1)
            .foregroundColor(isValid ? .primary : .red)
            .font(.caption)
            .padding(.top, -8)
    }
}
