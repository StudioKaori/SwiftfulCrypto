//
//  CoinDataService.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-20.
//

import Foundation
import Combine

class CoinDataService {
  
  // Publish the all coin data
  @Published var allCoins: [CoinModel] = []
  var coinSubscription: AnyCancellable?
  
  init() {
    getCoins()
  }
  
  // this method is only called inside of this class
  private func getCoins() {
    
    guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=USD&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
    
    // If you want to cancel this subscription, you can use coinSubscription (the publisher remains)
    coinSubscription = NetworkingManager.download(url: url)
      .decode(type: [CoinModel].self, decoder: JSONDecoder())
      .sink(receiveCompletion: { (completion) in
        switch completion {
        case .finished:
          print("finished")
          break
        case .failure(let error):
          print(error.localizedDescription)
        }
      }, receiveValue: { [weak self] (returnedCoins) in
        self?.allCoins = returnedCoins
        // Since it's only one time fetching, you don't need to keep subscribe it.
        self?.coinSubscription?.cancel()
      })
  }
}
