//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-20.
//

import Foundation

class CoinDataServices {
  
  @Published var allCoins: [CoinModel] = []
  
  init() {
    
  }
  
  // this method is only called inside of this class
  private func getCoins() {
    
    guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
    
    URLSession.shared.dataTaskPublisher(for: url)
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
      .decode(type: [CoinModel].self, decoder: JSONDecoder())
      .sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished:
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      }, receiveValue: { [weak self] (returnedCoins) in
        self?.allCoins = returnedCoins
      })
  }
}