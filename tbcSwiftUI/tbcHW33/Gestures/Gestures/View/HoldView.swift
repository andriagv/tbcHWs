//
//  HoldView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct HoldView: View {
    @State private var isFill = true
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            Image(isFill ? "Circle.fill" : "Circle")
                .gesture(
                    LongPressGesture(minimumDuration: 5)
                        .onEnded { _ in
                            isFill = false
                        }
                        .simultaneously(with: DragGesture(minimumDistance: 0)
                            .onEnded { _ in
                                isFill = true
                            }
                        )
                )
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    HoldView()
}







