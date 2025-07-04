//
//  MusicDiscView.swift
//  anotherHW
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct MusicDiscView: View {
    
    let artistName: String, coverImage: Image
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ZStack {
                Circle().foregroundColor(.primary_color)
                    .frame(width: 180, height: 180).modifier(NeuShadow())
                ForEach(0..<10, id: \.self) { i in
                    RoundedRectangle(cornerRadius: (80 + CGFloat((6 * i))) / 2)
                        .stroke(lineWidth: 0.25)
                        .foregroundColor(.disc_line)
                        .frame(width: 80 + CGFloat((6 * i)),
                               height: 80 + CGFloat((6 * i)))
                }
                coverImage.resizable().scaledToFill()
                    .frame(width: 70, height: 70).cornerRadius(35)
            }
            Text(artistName).foregroundColor(.text_primary)
                .modifier(FontModifier(.bold, size: 16))
                .padding(.top, 12).padding(.bottom, 6)
        }
    }
}

struct MusicDiscView_Previews: PreviewProvider {
    static var previews: some View {
        MusicDiscView(artistName: "dd", coverImage: Image("BorisBrejchaNeverLookBackImage"))
    }
}
