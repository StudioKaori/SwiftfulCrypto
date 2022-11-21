//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-20.
//

import Foundation
import Combine

class NetworkingManager {
  
  // Define the localised error
  enum NetworkingError: LocalizedError {
    // You can pass variables to the switch case in errorDescription and show it
    case badURLResponse(url: URL)
    case unknown
    
    // We can give LocalizedError
    var errorDescription: String? {
      switch self {
      case .badURLResponse(url: let url): return "[🔥] Bad responser from URL: \(url)"
      case .unknown: return "[⚠️] Unknow error occured"
      }
    }
  }
  
  static func download(url: URL) -> AnyPublisher<Data, any Error> {
    return URLSession.shared.dataTaskPublisher(for: url)
    // do in background thread
      .subscribe(on: DispatchQueue.global(qos: .default))
      .tryMap({ try handleURLResponse(output: $0, url: url) })
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  // To reuse the handling URL response, make a new function
  // In case you want to create another download func with different type of publisher(this case, it's dataTaskPublisher)
  static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
    
    // If you want to test throwing error, you can throw it here
    // throw NetworkingError.badURLResponse(url: url)
    
    guard let response = output.response as? HTTPURLResponse,
          // Make sure that HTTPURLResponse above has valid status code (successfull response range 200-299)
          response.statusCode >=  200 && response.statusCode < 300 else {
      throw NetworkingError.badURLResponse(url: url)
    }
    return output.data
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
