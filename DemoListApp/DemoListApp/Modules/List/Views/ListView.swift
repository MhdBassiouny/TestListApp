//
//  ListView.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 28/07/2024.
//

import SwiftUI

struct ListView: View {
    private var viewModel: ListViewViewModel
    
    init(viewModel: ListViewViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        CustomListView(viewModel: viewModel) { customer in
            rowView(customer)
        }
        .navigationBarItems(trailing: navigationCreateButton)
    }
    
    
    private var navigationCreateButton: some View {
        Button{
            viewModel.navigateToCreate()
        } label: {
            Image(systemName: "plus")
        }
    }
    
    private func rowView(_ customer: Customer) -> some View {
        VStack {
            Text(customer.firstName)
            Text(customer.lastName)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .contentShape(Rectangle())
        .onTapGesture {
            viewModel.navigateToEdit(customer: customer)
        }
    }
}

#Preview {
    ListView(viewModel: ListViewViewModel(repository: ListViewStaticRepository()))
}
