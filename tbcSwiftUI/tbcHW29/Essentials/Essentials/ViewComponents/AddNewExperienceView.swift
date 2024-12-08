//
//  AddNewExperienceView.swift
//  Essentials
//
//  Created by Apple on 08.12.24.
//

import SwiftUI

struct AddNewExperienceView: View {
    
    @State var companyNameInput = ""
    @State var roleInput = ""
    @State var durationInput = ""
    
    func makeInputField(label: String, placeholder: String, text: Binding<String>) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .makeTextStyle(color: Color(hex: "#6E6464"), size: 9, font: "Inter")
            
            TextField(placeholder, text: text)
                .textFieldStyle(.roundedBorder)
                .makeTextStyle(color: Color(hex: "#DBDBDB"), size: 12, font: "Roboto")
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
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            
            Button("Add Experience") {
                print("tapped")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .background(Color(hex: "#3B775B"))
            .foregroundColor(.white)
            .cornerRadius(10)
            
        }
        .padding()
        .background(Color(hex: "#13161F0D"))
        .cornerRadius(24)
    }
}

#Preview {
    AddNewExperienceView()
}
