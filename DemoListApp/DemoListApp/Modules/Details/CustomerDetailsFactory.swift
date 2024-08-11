//
//  CustomerDetailsFactory.swift
//  DemoListApp
//
//  Created by Abdullah Al Dabbous on 11/08/2024.
//

import Foundation
import SwiftUI

final class CustomerDetailsFactory {
    static func makeView(onSave: @escaping (Customer) -> Void) -> UIViewController {
        let createView = DetailsView(onSave: onSave)
        let createController = UIHostingController(rootView: createView)
        createController.title = "Details"
        return createController
    }
}
