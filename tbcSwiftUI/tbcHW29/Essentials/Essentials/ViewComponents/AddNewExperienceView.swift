//
//  AddNewExperienceView.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//

import SwiftUI

struct AddNewExperienceView: View {
    
    @Binding var experienceArray: [Experience]
    @Binding var titles: [String]
    
    @State var companyNameInput = ""
    @State var roleInput = ""
    @State var durationInput = ""
    
    func makeInputField(label: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .makeTextStyle(color: .darkGray, size: 9, font: "Inter")
            
            TextField(placeholder, text: text)
                .textFieldStyle(.roundedBorder)
                .foregroundColor(Color.black)
                .makeTextStyle(color: .textFieldGray, size: 12, font: "Roboto")
        }
    }
    
    var body: some View {
        VStack {
            
            Text("ADD New Working Experience:")
                .makeTextStyle(color: .black, size: 17, font: "Inter_Bold")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 16) {
                makeInputField(label: "COMPANY", placeholder: "Enter Company Name", text: $companyNameInput)
                makeInputField(label: "ROLE", placeholder: "Enter Role", text: $roleInput)
                makeInputField(label: "DURATION", placeholder: "Enter Duration", text: $durationInput)
            }
            .padding(.horizontal, 1)
            .padding(8)
            
            Button("Add Experience") {
                let newExperience = Experience(
                    company: companyNameInput,
                    role: roleInput,
                    duration: durationInput
                )
                experienceArray.append(newExperience)
                
                titles.append(roleInput)
                
                companyNameInput = ""
                roleInput = ""
                durationInput = ""
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Color.forestGreen)
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color.overlayGray)
        .cornerRadius(24)
    }
}

#Preview {
    AddNewExperienceView(
        experienceArray: .constant([
            Experience(company: "HDR Solution Inc.", role: "iOS Developer", duration: "2021 - Present"),
            Experience(company: "TechCorp", role: "Software Engineer", duration: "2018 - 2021")
        ]),
        titlestitles: .constant([
            "iOS Developer",
            "Swift Enthusiast",
            "Tech Lover"
        ])
    )
}
