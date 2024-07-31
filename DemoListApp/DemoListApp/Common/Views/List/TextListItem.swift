//
//  NoMoreData.swift
//  DemoListApp
//
//  Created by Muhammad Bassiouny on 1/13/24.
//

import SwiftUI

struct TextListItem: View {
    var text: String
    
    var body: some View {
        HStack {
            Spacer()
            Text(text)
                .font(.subheadline)
                .foregroundStyle(Color.gray)
            Spacer()
        }
        .listRowBackground(Color.clear)
    }
}

#Preview {
    TextListItem(text: "No More Data")
}
