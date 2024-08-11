//
//  ViewController.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 27/07/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    @IBOutlet weak var swiftUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        swiftUIButton.addTarget(self, action: #selector(navigateToSwiftUI), for: .touchUpInside)
    }

    @objc private func navigateToSwiftUI() {
        let customerListView = CustomerListFactory.makeView()
        navigationController?.pushViewController(customerListView, animated: true)
    }
}

