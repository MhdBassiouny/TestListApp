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
        let viewModel = ListViewViewModel(repository: ListViewStaticRepository())
        let view = UIHostingController(rootView: ListView(viewModel: viewModel))
        viewModel.router.controller = view
        view.title = viewModel.navigationBarTitle
        navigationController?.pushViewController(view, animated: true)
    }
}

