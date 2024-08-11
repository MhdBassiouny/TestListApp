//
//  DetailsView.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 29/07/2024.
//

import SwiftUI

struct DetailsView: View {
    @State var viewModel = DetailsViewModel()
    @FocusState private var focusField: FormInputFields?
    @Environment(\.dismiss) private var dismiss
    private let onSave: (Customer) -> Void
    
    init(onSave: @escaping (Customer) -> Void) {
        self.onSave = onSave
    }
    
    var body: some View {
        CustomFormView(focusField: $focusField, viewModel: viewModel) {
            Section("Customer") {
                CustomTextField(
                    fieldType: FormInputFields.firstName,
                    text: $viewModel.customer.firstName,
                    startEditing: $viewModel.firstNameEditing,
                    isRequired: true
                )
                .focused($focusField, equals: .firstName)

                CustomTextField(
                    fieldType: FormInputFields.lastName,
                    text: $viewModel.customer.lastName,
                    startEditing: $viewModel.lastNameEditing,
                    isRequired: true
                )
                .focused($focusField, equals: .lastName)

                CustomTextField(
                    fieldType: FormInputFields.email,
                    text: $viewModel.customer.email
                )
                .focused($focusField, equals: .email)
            }
            .onPreferenceChange(ValidationPreferenceKey.self) { value in
                viewModel.validationFields.merge(value, uniquingKeysWith: { $1 })
            }
            
            Section {
                Button("Complete Action") {
                    if viewModel.validate() {
                        onSave(viewModel.customer)
                        dismiss()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .listRowBackground(Color.clear)
        }
    }
}

#Preview {
    DetailsView(onSave: { _ in })
}
