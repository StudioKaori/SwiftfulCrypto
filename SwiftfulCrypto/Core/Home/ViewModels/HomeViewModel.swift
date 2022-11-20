//
//  HomeViewModel.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-18.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
  
  @Published var allCoins: [CoinModel] = []
  @Published var portfolioCoins: [CoinModel] = []
  
  // initialise the new data service and get coin data.
  private let dataService = CoinDataServices()
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    addSubscribers()
  }
  
  func addSubscribers() {
    
    // Use $allCoins with money sign, this means Publisher
    // When the allCoins is published, this subscriber will get notified.
    dataService.$allCoins
      .sink { [weak self] (returnedCoins) in
        self?.allCoins = returnedCoins
      }
      .store(in: &cancellables)
    
  }
}
