//
//  SpinView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

import SwiftUI

struct SpinView: View {
    @StateObject private var viewModel = SpinViewModel()
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            Image(.circleFill)
                .rotationEffect(.degrees(viewModel.rotationAngle))
                .gesture(
                    DragGesture()
                        .onChanged { viewModel.onDragChanged($0) }
                )
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    SpinView()
}
