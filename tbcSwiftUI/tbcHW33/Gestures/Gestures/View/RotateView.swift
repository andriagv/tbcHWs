//
//  RotateView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct RotateView: View {
    @StateObject private var viewModel = RotateViewModel()
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            
            Image("Calculator")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .scaleEffect(viewModel.imageModel.scale)
                .rotationEffect(viewModel.imageModel.rotationAngle)
                .gesture(
                    MagnificationGesture()
                        .onChanged { viewModel.onScaleChanged($0) }
                )
                .simultaneousGesture(
                    RotationGesture()
                        .onChanged { viewModel.onRotateChanged($0) }
                        .onEnded { viewModel.onRotateEnded($0) }
                )
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    RotateView()
}

