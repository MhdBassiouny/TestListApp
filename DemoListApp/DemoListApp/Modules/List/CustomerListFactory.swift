//
//  CustomerListFactory.swift
//  DemoListApp
//
//  Created by Abdullah Al Dabbous on 11/08/2024.
//

import Foundation
import SwiftUI

final class CustomerListFactory {
    static func makeView() -> UIViewController {
        let viewModel = ListViewViewModel(repository: ListViewStaticRepository())
        let view = UIHostingController(rootView: ListView(viewModel: viewModel))
        viewModel.router.controller = view
        view.title = viewModel.navigationBarTitle
        return view
    }
}
