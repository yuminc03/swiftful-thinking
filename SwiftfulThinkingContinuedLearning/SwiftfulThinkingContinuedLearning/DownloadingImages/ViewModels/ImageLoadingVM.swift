//
//  ImageLoadingVM.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/19.
//

import Foundation
import SwiftUI
import Combine

final class ImageLoadingVM: ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var cancellable = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    
    let urlString: String
    let imageKey: String

    init(url: String, key: String) {
        urlString = url
        imageKey = key
        getImage()
    }
    
    private func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image!")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    private func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                guard let self,
                      let image = returnedImage else { return }
                self.image = image
                manager.add(key: imageKey, value: image)
            }
            .store(in: &cancellable)
    }
}
