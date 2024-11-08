//
//  ImageViewModel.swift
//  MultithreadingAndConcurrency
//
//  Created by Nika Topuria on 06.11.24.
//

import Foundation
import UIKit

final class ImageViewModel {
    private let networkManager: NetworkManaging
    private let imageProcessor: ImageProcessing
    
    var onImagesUpdated: (() -> Void)?
    
    var images: [UIImage] = [] {
        didSet {
            onImagesUpdated?()
        }
    }
    
    private var imageUrls: [URL] = []
    
    init(
        networkManager: NetworkManaging = NetworkManager(),
        imageProcessor: ImageProcessing = ImageProcessor()
    ) {
        self.networkManager = networkManager
        self.imageProcessor = imageProcessor
    }
    
    // MARK: - დეველოპერებო, აქ უნდა ღვაროთ ოფლი
    
    // დაასრულეთ მეთოდის იმპლემენტაცია GCD-ის გამოყენებით (DispatchGroup)
    func fetchImagesWithGCD() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        
        let dispatchGroup = DispatchGroup()
        var downloadedImages: [UIImage] = []
        let imagesAccessQueue = DispatchQueue(label: "com.app.MultithreadingAndConcurrency")
        
        for url in imageUrls {
            dispatchGroup.enter()
            fetchAndProcessImage(from: url) { image in
                if let image = image {
                    imagesAccessQueue.sync {
                        downloadedImages.append(image)
                    }
                }
                dispatchGroup.leave()
            }
        }
        dispatchGroup.notify(queue: DispatchQueue.main) { [weak self] in
            self?.images = downloadedImages
        }
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია NSOperationQueue-ის გამოყენებით
    func fetchImagesWithOperationQueue() {
        // არ დაგავიწყდეთ, გადმოწერილი იმიჯები საბოლოოდ უნდა მოხვდეს images მასივში.
        let operationQueue = OperationQueue()
        var downloadedImages: [UIImage] = []
        let lock = NSLock()
        let completionOperation = BlockOperation {
            DispatchQueue.main.async { [weak self] in
                self?.images = downloadedImages
            }
        }
        
        for url in imageUrls {
            let downloadOperation = BlockOperation { [weak self] in
                let semaphore = DispatchSemaphore(value: 0)
                self?.fetchAndProcessImage(from: url) { image in
                    if let image = image {
                        lock.lock()
                        downloadedImages.append(image)
                        lock.unlock()
                    }
                    semaphore.signal()
                }
                semaphore.wait()
            }
            completionOperation.addDependency(downloadOperation)
            operationQueue.addOperation(downloadOperation)
        }
        operationQueue.addOperation(completionOperation)
    }
    
    // დაასრულეთ მეთოდის იმპლემენტაცია async/await-ის გამოყენებით (შეგიძლიათ დაიხმაროთ fetchAndProcessImageAsync())
    var downloadedImages: [UIImage] = []
    func fetchImagesWithAsyncAwait() {
        Task { [weak self] in
            guard let self = self else { return }
            for url in imageUrls {
                if let image = await self.fetchAndProcessImageAsync(from: url) {
                    downloadedImages.append(image)
                }
            }
            DispatchQueue.main.async { [weak self] in
                self?.images.append(contentsOf: self?.downloadedImages ?? [])
            }
        }
    }
    
    func updateNumberOfImages(to count: Int) {
        generateImageUrls(numberOfImages: count)
    }
    
    private func generateImageUrls(numberOfImages: Int) {
        let maxImageNumber = 700
        var urls: [URL] = []
        
        for _ in 1...numberOfImages {
            let randomImageNumber = Int.random(in: 1...maxImageNumber)
            if let url = URL(string: "https://yavuzceliker.github.io/sample-images/image-\(randomImageNumber).jpg") {
                urls.append(url)
            }
        }
        self.imageUrls = urls
    }
    
    private func fetchAndProcessImage(from url: URL?, completion: @escaping (UIImage?) -> Void) {
        guard let url else { return }
        networkManager.downloadImage(from: url) { [weak self] image in
            guard let self = self, let image = image else {
                completion(nil)
                return
            }
            self.imageProcessor.applyFilter(to: image) { processedImage in
                completion(processedImage)
            }
        }
    }
    
    private func fetchAndProcessImageAsync(from url: URL?) async -> UIImage? {
        await withCheckedContinuation { continuation in
            self.fetchAndProcessImage(from: url) { image in
                continuation.resume(returning: image)
            }
        }
    }
}
