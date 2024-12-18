//
//  RotateViewModel.swift
//  Gestures
//
//  Created by Apple on 18.12.24.
//

import Foundation
import SwiftUI

final class RotateViewModel: ObservableObject {
    @Published var imageModel: ImageModel
    
    init(imageModel: ImageModel = ImageModel()) {
        self.imageModel = imageModel
    }
    
    func onRotateChanged(_ angle: Angle) {
        imageModel.rotationAngle = angle + imageModel.baseRotationAngle
    }
    
    func onRotateEnded(_ angle: Angle) {
        imageModel.baseRotationAngle = imageModel.rotationAngle
    }
    
    func onScaleChanged(_ scale: CGFloat) {
        imageModel.scale = scale * imageModel.baseScale
    }
    
    func onScaleEnded(_ scale: CGFloat) {
        imageModel.baseScale = imageModel.scale
    }
}

