//
//  SkillsView.swift
//  SwiftUIBasics
//
//  Created by Apple on 06.12.24.
//

import SwiftUI

struct SkillsView: View {
    
    let skills = [
        skill(type: "SwiftUI"),
        skill(type: "IOS Development"),
        skill(type: "Problem Solving"),
        skill(type: "UI/UX Design")
        ]
    
    var body: some View {
        
        VStack(alignment: .leading ,spacing: 16) {
            VStack {
                Text("Skills")
                    .font(.system(size: 18))
                    .bold()
            }
            VStack(alignment: .leading, spacing: 5) {
                ForEach(skills, id: \.type) { skill in
                    Text("• \(skill.type)")
                }
            }
                .padding(.horizontal, 10)
                .font(.system(size: 15))
                .opacity(0.8)
        }
    }
    
    
}

#Preview {
    SkillsView()
}
