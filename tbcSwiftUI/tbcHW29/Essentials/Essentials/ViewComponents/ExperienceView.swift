//
//  ExperienceView.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//

import SwiftUI

struct ExperienceView: View {
    
    var company: String
    var role: String
    var duration: String
    
    var body: some View {
        HStack {
            
            VStack (alignment: .leading, spacing: 10) {
                Text(company)
                    .makeTextStyle(color: .black, size: 17, font: "Inter_Bold")
                    .padding(.leading, 5)
                
                Text(role)
                    .makeTextStyle(color: Color(hex: "#6E6464"), size: 15, font: "Inter")
                
                Text(duration)
                    .makeTextStyle(color: Color(hex: "#6E6464"), size: 15, font: "Inter")
            }
            .padding(28)
            
            Spacer()
        }
        .background(Color(hex: "#13161F0D"))
        .cornerRadius(24)
    } 
}

#Preview {
    ExperienceView(company: "zz", role: "oo", duration: "ro")
}

