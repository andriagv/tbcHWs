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
        imageModel.rotationAngle = angle
    }
    
    func onRotateEnded(_ angle: Angle) {
        imageModel.rotationAngle = angle
    }
    
    func onScaleChanged(_ scale: CGFloat) {
        imageModel.scale = scale
    }
    
    func onScaleEnded(_ scale: CGFloat) {
        imageModel.baseScale *= scale
    }
}

