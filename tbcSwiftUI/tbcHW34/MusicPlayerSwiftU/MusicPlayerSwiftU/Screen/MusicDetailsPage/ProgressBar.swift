//
//  ProgressBar.swift
//  MusicPlayerSwiftU
//
//  Created by Apple on 25.12.24.
//

import SwiftUI

struct ProgressBar: UIViewRepresentable {
    @Binding var progress: Float
    
    func makeUIView(context: Context) -> UIProgressView {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = UIColor.systemGray
        progressView.progressTintColor = UIColor.systemBlue
        return progressView
    }
    
    func updateUIView(_ uiView: UIProgressView, context: Context) {
        uiView.progress = progress
    }
}
