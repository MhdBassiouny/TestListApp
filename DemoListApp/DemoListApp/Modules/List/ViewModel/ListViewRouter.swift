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
    
    func navigateToDetailView(onSave: @escaping (Customer) -> Void) {
        let createController = CustomerDetailsFactory.makeView(onSave: onSave)
        controller?.show(createController, sender: nil)
    }
}
