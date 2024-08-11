//
//  CustomerSharedRepository.swift
//  DemoListApp
//
//  Created by Abdullah Al Dabbous on 11/08/2024.
//

import Foundation

protocol CustomerSharedRepositoryProtocol {
    func get() -> Customer?
    func set(customer: Customer)
    func clear()
}

class CustomerSharedRepository: CustomerSharedRepositoryProtocol {
    static let shared = CustomerSharedRepository()
    private var customer: Customer? = nil
    
    private init(){}
    
    func get() -> Customer? {
        return customer
    }
    
    func set(customer: Customer) {
        self.customer = customer
    }
    
    func clear() {
        customer = nil
    }
}
