//
//  ListViewModel.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 28/07/2024.
//

import Foundation

@Observable
final class ListViewViewModel: ListViewModel {    
    var router = ListViewRouter()
    var listData: [Customer] = []
    var state: ListState = .normal
    var pageOffset: Int = 0
    var navigationBarTitle: String = "Test List"
    var repository: ListViewRepository
    
    init(repository: ListViewRepository) {
        self.repository = repository
    }
    
    func loadList() {
        guard state == .normal else { return }
        Task {
            do {
                let list = try await repository.getListData(pageOffset: pageOffset)
                pageOffset += repository.pageSize
                listData += list
                state = .loadedAll
            } catch {
                state = .loadedAll
            }
        }
    }
    
    func navigateToEdit(customer: Customer) {
        guard let index = listData.firstIndex(of: customer) else { return }
        CustomerSharedRepository.shared.set(customer: customer)
        router.navigateToDetailView() { text in
            self.listData[index] = text
        }
    }
    
    func navigateToCreate() {
        router.navigateToDetailView() { customer in
            self.listData.insert(customer, at: 0)
        }
    }
}
