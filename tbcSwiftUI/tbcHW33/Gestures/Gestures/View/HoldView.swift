//
//  HoldView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct HoldView: View {
    @StateObject private var viewModel = HoldViewModel()
    
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            
            Image(viewModel.model.isFill ? "Circle.fill" : "Circle")
                .gesture(
                    LongPressGesture(minimumDuration: 5)
                        .onEnded { _ in
                            viewModel.onLongPressEnded()
                        }
                        .simultaneously(with: DragGesture(minimumDistance: 0)
                            .onEnded { _ in
                                viewModel.onDragEnded()
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







