//
//  TabExperiencesView.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//

import SwiftUI

struct TabExperiencesView: View {
    @State var experienceArray: [Experience] = [
        Experience(company: "HDR Solution Inc.", role: "IOS Developer", duration: "2021 - Present"),
        Experience(company: "TechCorp", role: "Swift Enthusiast", duration: "2018 - 2021"),
        Experience(company: "HobbyHub", role: "Tech Lover", duration: "2013 - 2024"),
    ]
    
    @State var titles = [
        "iOS Developer",
        "Swift Enthusiast",
        "Tech Lover"
    ]
    
    var body: some View {
        VStack {
            
            VStack {
                HeaderView(titles: $titles)
                
                Text("Work Experience")
                    .makeTextStyle(color: .black, size: 20, font: "Inter")
                    .frame(maxWidth: .infinity , alignment: .leading)
                    .padding()
            }
            
            VStack(alignment: .center, spacing: 20) {
                TabView {
                    ForEach(experienceArray) { experience in
                        ExperienceView(
                            company: experience.company,
                            role: experience.role,
                            duration: experience.duration
                        )
                    }
                }
                .tabViewStyle(.page)
                .frame(height: 150)
                
                AddNewExperienceView(experienceArray: $experienceArray, titles: $titles)
            }
        }
    }
}

#Preview {
    TabExperiencesView()
}
