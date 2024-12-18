//
//  TrashView.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import SwiftUI

struct TrashView: View {
    @StateObject private var viewModel = TrashViewModel()

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.top)
            
            if !viewModel.isHidden {
                Image("File")
                    .offset(
                        CGSize(
                            width: viewModel.offset.width + viewModel.endPosition.x,
                            height: viewModel.offset.height + viewModel.endPosition.y
                        )
                    )
                    .gesture(
                        DragGesture()
                            .onChanged { viewModel.onDragChanged($0) }
                            .onEnded { viewModel.onDragEnded($0) }
                    )
            }
            
            Image("Trash1")
                .position(viewModel.trashPosition)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    TrashView()
}

