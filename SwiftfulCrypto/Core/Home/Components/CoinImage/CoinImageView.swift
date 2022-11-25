//
//  CoinImageView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-25.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
  
  @Published var image: UIImage? = nil
  @Published var isLoading: Bool = false
  
  init() {
    getImage()
  }
  
  private func getImage() {
    
  }
  
}

struct CoinImageView: View {
  
  @Published var vm = CoinImageViewModel()
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CoinImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoinImageView()
    }
}
