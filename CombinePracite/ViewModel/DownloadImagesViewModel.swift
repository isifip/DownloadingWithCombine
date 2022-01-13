//
//  DownloadImagesViewModel.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import Foundation
import Combine

class DownloadImagesViewModel: ObservableObject {
    
    @Published var dataArray: [Photo] = []
    var cancellables = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photos
            .sink { [weak self] returnedPhotos in
                self?.dataArray = returnedPhotos
            }
            .store(in: &cancellables)
    }
}
