//
//  HomeHeaderView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct HomeHeaderView: View {
    let HORIZONTAL_SPACING: CGFloat = 24
    let headerStr: String
    var body: some View {
        HStack(alignment: .center) {
            Text(headerStr).foregroundColor(.text_header)
                .modifier(FontModifier(.black, size: 28))
            Spacer()
            Button(action: {  }) {
                Image.search.resizable().frame(width: 16, height: 16)
                    .padding(12).background(Color.primary_color)
                    .cornerRadius(20).modifier(NeuShadow())
            }
        }.padding(.top, 12).padding(.horizontal, HORIZONTAL_SPACING)
    }
}

#Preview {
    HomeHeaderView(headerStr: "holla")
}
