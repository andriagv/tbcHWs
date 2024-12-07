//
//  ImageView.swift
//  Essentials
//
//  Created by Apple on 07.12.24.
//

import SwiftUI

struct ImageView: View {
    
    let titles = [
        ("iOS Developer"),
        ("Swift Enthusiast"),
//        ("Swift Enthusiast"),
//        ("Swift Enthusiast"),
//        ("Swift Enthusiast"),
//        ("Swift Enthusiast"),
        ("Tech Lover")
    ]
    
    var body: some View {
        VStack {
            
            Image("image_1")
                .frame(width: 102)
                .padding(9)
                .background(Color(hex: "#FFFFFF"))
                .clipShape(Circle())
            
            Text("John Doe")
                .makeTextStyle(color: Color(hex: "#000000"), size: 24, font: "Inter_bold")
                .frame(width: 107)
                .frame(height: 22)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(0..<titles.count, id: \.self) { index in
                        let title = titles[index]
                        Text(title)
                        
                        if index < titles.count - 1 {
                            Divider()
                                .background(Color.black)
                        }
                    }
                }
            }
            .makeTextStyle(color: Color(hex: "#6E6464"), size: 15, font: "Inter_bold")
            .frame(height: 20)
            .padding(.leading, 43)
        }
    }
}

#Preview {
    ImageView()
}
