//
//  HeaderView.swift
//  Essentials
//
//  Created by Apple on 07.12.24.
//

import SwiftUI

struct HeaderView: View {
    @Binding var titles: [String]
    
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
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(titles, id: \.self) { title in
                        Text(title)
                        if title != titles.last {
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
    HeaderView(titles: .constant([
        "iOS Developer",
        "Swift Enthusiast",
        "Tech Lover"
    ]))
}
