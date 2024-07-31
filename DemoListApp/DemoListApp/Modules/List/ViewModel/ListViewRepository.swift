//
//  ListViewRepository.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 29/07/2024.
//

import Foundation

protocol ListViewRepository {
    var pageSize: Int { get }
    
    func getListData(pageOffset: Int) async throws -> [Customer]
}

struct ListViewStaticRepository: ListViewRepository {
    let pageSize = 20
    
    func getListData(pageOffset: Int) async throws -> [Customer] {
        [
            Customer(firstName: "first", lastName: "first", email: "first@test.com"),
            Customer(firstName: "second", lastName: "second", email: "second@test.com"),
            Customer(firstName: "third", lastName: "third", email: "third@test.com"),
            Customer(firstName: "fourth", lastName: "fourth", email: "fourth@test.com"),
            Customer(firstName: "fifth", lastName: "fifth", email: "fifth@test.com"),
            Customer(firstName: "last", lastName: "last", email: "last@test.com")
        ]
    }
}
