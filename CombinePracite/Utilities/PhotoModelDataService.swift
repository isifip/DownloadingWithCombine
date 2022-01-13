//
//  PhotoModelDataService.swift
//  CombinePracite
//
//  Created by Irakli Sokhaneishvili on 13.01.22.
//

import Foundation
import Combine

class PhotoModelDataService {
    static let instance = PhotoModelDataService() // singleton
    
    @Published var photos: [Photo] = []
    var cancellables = Set<AnyCancellable>()
    
    private init() {
        downloadData()
    }
    
    func downloadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [Photo].self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error downloading data \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returndPhotos in
                self?.photos = returndPhotos
            }
            .store(in: &cancellables)

        
    }
    
    private func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
                throw URLError(.badServerResponse)
            }
        return output.data
    }
}
