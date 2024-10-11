//
//  DemoListAppTests.swift
//  DemoListAppTests
//
//  Created by Muhammad Bassiouny on 05/10/2024.
//

import XCTest
@testable import DemoListApp


final class DemoListAppListScreenTests: XCTestCase {

    private var viewModel: ListViewViewModel!
    private let repository = ListViewStaticRepository()
    
    override func setUp() {
      viewModel = ListViewViewModel(repository: repository)
    }
    
    override func tearDown() {
        viewModel = nil
    }
    
    func test_initial_State() async {
        XCTAssertEqual(viewModel.listData.count, 0)
        XCTAssertEqual(viewModel.state, .normal)
    }
    
    func test_loading_list_data() async {
        await viewModel.loadList()
        XCTAssertTrue(viewModel.listData.count > 0)
        XCTAssertEqual(viewModel.state, .loadedAll)
        XCTAssertTrue(viewModel.pageOffset > 0)

    }


}


final class DemoListAppDetailsScreenTests: XCTestCase {

    private var viewModel: DetailsViewModel!
    
    override func tearDown() {
        viewModel = nil
    }
    
    func test_creating_new_customer_with_valid_data() {
        viewModel = DetailsViewModel()
        viewModel.customer.firstName = "Test"
        viewModel.customer.lastName = "test"
        viewModel.customer.email = "test@test.com"
        XCTAssertTrue(viewModel.validate())
    }
    
    func test_showing_customer_details_data() {
        CustomerSharedRepository.shared.set(customer: Customer(firstName: "Test", lastName: "LastName", email: "email@domain.com"))
        viewModel = DetailsViewModel()
        XCTAssertEqual(viewModel.customer.firstName, "Test")
        XCTAssertNil(CustomerSharedRepository.shared.get())
    }
}
