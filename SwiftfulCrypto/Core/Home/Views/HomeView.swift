//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      ZStack {
        // background layer
        Color.theme.background
          .ignoresSafeArea()
        
        // content layer
        VStack {
          Text("Header")
          
          // By setting spacer here, it can push up the header to the top although minLength is 0
          Spacer(minLength: 0)
        }
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
