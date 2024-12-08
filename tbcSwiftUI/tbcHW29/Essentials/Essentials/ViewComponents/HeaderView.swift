//
//  HeaderView.swift
//  Essentials
//
//  Created by Apple on 07.12.24.
//

import SwiftUI

struct HeaderView: View {
    
    let titles = [
        ("iOS Developer"),
        ("Swift Enthusiast"),
        ("Tech Lover")
    ]
    
    var body: some View {
        
        VStack(alignment: .center) {
            Image("image_1")
                .frame(width: 102)
                .padding(9)
                .background(Color(hex: "#FFFFFF"))
                .clipShape(Circle())
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 5)

            Text("John Doe")
                .makeTextStyle(color: Color(hex: "#000000"), size: 24, font: "Inter_bold")
                .multilineTextAlignment(.center)
                .frame(width: 107)
                .frame(height: 22)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<titles.count, id: \.self) { index in
                        let title = titles[index]
                        Text(title)

                        if index < titles.count - 1 {
                            Divider()
                                .frame(height: 20)
                                .background(Color.black)
                                .padding(.horizontal, 4)
                        }
                    }
                }
            }
            .makeTextStyle(color: Color(hex: "#6E6464"), size: 15, font: "Inter_bold")
            .frame(height: 20)
        }
    }
}

#Preview {
    HeaderView()
}
