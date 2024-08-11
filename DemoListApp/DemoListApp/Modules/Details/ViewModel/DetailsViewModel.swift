//
//  DetailsViewModel.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 30/07/2024.
//

import SwiftUI

@Observable
class DetailsViewModel: FormViewModel {
    var customer: Customer
    var fields: [FormInputFields] = [.firstName, .lastName, .email]
    var formState: FormStatus = .loaded
    var validationFields: [String: Bool] = [:]
    var firstNameEditing: Bool? = false
    var lastNameEditing: Bool? = false
    
    init() {
        guard let customer = CustomerSharedRepository.shared.get() else {
            self.customer = Customer()
            return
        }
        self.customer = customer
        CustomerSharedRepository.shared.clear()
    }
    
    func loadData() async {
        
    }
    
    func validate() -> Bool {
        return validationFields.values.allSatisfy { $0 }
    }
}
