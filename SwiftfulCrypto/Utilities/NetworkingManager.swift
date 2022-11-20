//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-20.
//

import Foundation
import Combine

class NetworkingManager {
  
  static func download(url: URL) -> AnyPublisher<Data, any Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
    // do in background thread
      .subscribe(on: DispatchQueue.global(qos: .default))
      .tryMap { (output) -> Data in
        
        guard let response = output.response as? HTTPURLResponse,
              // Make sure that HTTPURLResponse above has valid status code (successfull response range 200-299)
              response.statusCode >=  200 && response.statusCode < 300 else {
          throw URLError(.badServerResponse)
        }
        return output.data
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  static func handleCompletion(completion: Subscribers.Completion<Error>) {
    switch completion {
    case .finished:
      print("finished")
      break
    case .failure(let error):
      print(error.localizedDescription)
    }
  }
}
