//
//  CustomFormView.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 5/22/24.
//

import SwiftUI

protocol FormViewModel: Observable, AnyObject {
    associatedtype T: InputField
    var fields: [T] { get set }
    var formState: FormStatus { get set }
    
    func loadData() async
}

enum FormStatus: Equatable {
    case loaded
    case isLoading
    case isSubmitting
}

struct CustomFormView<Content: View, U: FormViewModel, T: InputField>: View {
    @FocusState.Binding var focusField: T?
    var viewModel: U
    var fields: [T]
    var content: () -> Content
    
    init(focusField: FocusState<T?>.Binding, viewModel: U, @ViewBuilder _ content: @escaping () -> Content) {
        self._focusField = focusField
        self.viewModel = viewModel
        self.fields = viewModel.fields as? [T] ?? []
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Form {
                content()
            }
            .font(.subheadline)
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    KeyboardToolBar(focusField: $focusField, fields: fields)
                }
            }
            
            switch viewModel.formState {
            case .loaded:
                EmptyView()
            case .isLoading:
                CustomProgressView(scaleEffect: 2)
                    .task {
                        await viewModel.loadData()
                    }
            case .isSubmitting:
                CustomProgressView(scaleEffect: 2)
            }
        }
    }
}
