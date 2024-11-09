//
//  Protocols.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import UIKit

protocol NetworkManaging {
    func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void)
}

protocol ImageProcessing {
    func applyFilter(to image: UIImage, completion: @escaping (UIImage) -> Void)
}
