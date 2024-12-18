//
//  SpinView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct SpinView: View {
    
    let screenWidth = UIScreen.main.bounds.width
    @State var offset = CGSize.zero
    @State var endPosition = CGPoint.zero
    @State var rotationAngle: Double = 0
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            Image(.circleFill)
                .frame(width: screenWidth, height: screenWidth)
                .rotationEffect(.degrees(rotationAngle))
                .offset(
                    CGSize(
                        width: offset.width + endPosition.x ,
                        height: offset.height + endPosition.y))
            
                .gesture(
                    DragGesture()
                        .onChanged {
                            offset = $0.translation
                            rotationAngle = Double(offset.height) * 0.7
                        }.onEnded({ dragValue in
                            endPosition.x = dragValue.location.x - screenWidth / 2
                            endPosition.y = dragValue.location.y - screenWidth / 2
                            offset = .zero
                        })
                )
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    SpinView()
}
