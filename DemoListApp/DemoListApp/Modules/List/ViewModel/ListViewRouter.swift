//
//  ListViewRouter.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 29/07/2024.
//

import UIKit
import SwiftUI

class ListViewRouter: Router {
    weak var controller: UIViewController?
    
    func navigateToDetailView(customer: Customer, onSave: @escaping (Customer) -> Void) {
        let createView = DetailsView(customer: customer, onSave: onSave)
        let createController = UIHostingController(rootView: createView)
        createController.title = "Details"
        controller?.show(createController, sender: nil)
    }
}
