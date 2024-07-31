//
//  KeyboarToolBar.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 1/9/24.
//

import SwiftUI

struct KeyboardToolBar<T: InputField>: View {
    @FocusState.Binding var focusField: T?
    var fields: [T]
    
    var body: some View {
        ZStack {
            Text(focusField?.placeHolder ?? "")
                .font(.caption)
                .foregroundStyle(Color.gray)
            
            HStack {
                Button(action: focusPreviousField) {
                    Image(systemName: "chevron.up")
                        .resize(to: 15)
                }
                .disabled(focusField == fields.first)
                
                Button(action: focusNextField) {
                    Image(systemName: "chevron.down")
                        .resize(to: 15)
                }
                .disabled(focusField == fields.last)
                
                Spacer()
                
                Button("Done") {
                    focusField = nil
                }
            }
        }
    }
    
    private func focusPreviousField() {
        guard let focusField = focusField else { return }
        if let currentIndex = fields.firstIndex(of: focusField), currentIndex != 0 {
            self.focusField = fields[currentIndex - 1]
        }
    }

    private func focusNextField() {
        guard let focusField = focusField else { return }
        if let currentIndex = fields.firstIndex(of: focusField), currentIndex + 1 !=  fields.count {
            self.focusField = fields[currentIndex + 1]
        }
    }
}

extension Image {
    func resize(to size: CGFloat) -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
