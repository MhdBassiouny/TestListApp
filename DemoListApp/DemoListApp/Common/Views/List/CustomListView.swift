//
//  CustomListView.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 1/31/24.
//

import SwiftUI

protocol ListViewModel: Observable, AnyObject {
    associatedtype T: Hashable
    var listData: [T] { get set }
    var state: ListState { get set }
    var pageOffset: Int { get set }
    var navigationBarTitle: String { get }
    
    func loadList()
}

extension ListViewModel {
    func resetView() {
        listData = []
        pageOffset = 0
        state = .normal
    }
}

enum ListState: Equatable {
    case normal
    case isLoading
    case loadedAll
}

struct CustomListView<ViewModel: ListViewModel, Content: View>: View {
    var viewModel: ViewModel
    var content: (ViewModel.T) -> Content
    
    var body: some View {
        List {
            ForEach(viewModel.listData, id: \.self) { item in
                content(item)
            }
            
            switch viewModel.state {
            case .normal:
                Color.clear
                    .onAppear {
                        viewModel.loadList()
                    }
            case .isLoading:
                CustomProgressView(scaleEffect: 2)
            case .loadedAll:
                TextListItem(text: "No More Data")
            }
        }
        .refreshable {
            viewModel.resetView()
            viewModel.loadList()
        }
    }
}
