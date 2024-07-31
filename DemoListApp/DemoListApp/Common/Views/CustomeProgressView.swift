//
//  CustomProgressView.swift
//  MyFatoorah
//
//  Created by Muhammad Bassiouny on 5/6/24.
//  Copyright © 2024 MyFatoorah. All rights reserved.
//

import SwiftUI

struct CustomProgressView: View {
    var scaleEffect: CGFloat
    
    var body: some View {
        HStack(alignment: .center) {
            ProgressView()
                .scaleEffect(scaleEffect)
        }
        .frame(maxWidth: .infinity)
        .listRowBackground(Color.clear)    }
}

#Preview {
    CustomProgressView(scaleEffect: 3)
}
