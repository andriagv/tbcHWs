//
//  ImageProcessor.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import UIKit

final class ImageProcessor: ImageProcessing {
    func applyFilter(to image: UIImage, completion: @escaping (UIImage) -> Void) {
        print("Starting filter for image on thread \(Thread.current)")
        let startTime = Date()
        
        DispatchQueue.global().async {
            let filteredImage = self.convertToGrayscale(image: image)
            let endTime = Date()
            print("Finished filter for image in \(endTime.timeIntervalSince(startTime)) seconds on thread \(Thread.current)")
            completion(filteredImage)
        }
    }
    
    private func convertToGrayscale(image: UIImage) -> UIImage {
        guard let currentCGImage = image.cgImage else { return image }
        let currentCIImage = CIImage(cgImage: currentCGImage)
        
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter?.setValue(currentCIImage, forKey: kCIInputImageKey)
        
        if let output = filter?.outputImage,
           let cgImage = CIContext(options: nil).createCGImage(output, from: output.extent) {
            return UIImage(cgImage: cgImage)
        }
        
        return image
    }
}
