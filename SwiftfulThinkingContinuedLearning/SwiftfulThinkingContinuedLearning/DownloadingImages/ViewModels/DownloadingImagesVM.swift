//
//  DownloadingImagesVM.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Yumin Chu on 2023/06/18.
//

import Foundation
import Combine

final class DownloadingImagesVM: ObservableObject {
    
    @Published var dataArray = [PhotoModel]()
    var cancellables = Set<AnyCancellable>()
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] returnedPhotoModels in
                self?.dataArray = returnedPhotoModels
            }
            .store(in: &cancellables)
    }
}
