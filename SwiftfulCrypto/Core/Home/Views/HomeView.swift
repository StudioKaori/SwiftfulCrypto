//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct HomeView: View {
  
  @EnvironmentObject private var vm: HomeViewModel
  @State private var showPortfolio: Bool = false
  
  var body: some View {
    ZStack {
      // background layer
      Color.theme.background
        .ignoresSafeArea()
      
      // content layer
      VStack {
        homeHeader
        
        if !showPortfolio {
          allCoinsList
          // .transition makes animation pushong the element away to the edge
          .transition(.move(edge: .leading))
        }
        
        if showPortfolio {
          portfolioCoinsList
          .transition(.move(edge: .trailing))
        }
        
        
        // By setting spacer here, it can push up the header to the top although minLength is 0
        Spacer(minLength: 0)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      HomeView()
        .navigationBarBackButtonHidden(true)
    }
    // add vm for the preview, but maybe because of Xcode update
    // working without giving this code.
    .environmentObject(dev.homeVM)
  }
}

// The code is too long due to this header view
// To solve this, create the extension.
extension HomeView {
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconName: showPortfolio ? "plus" :"info")
      // To get rid of animation for the icon, use this
        .animation(.none)
        .background(
          // To emphasize the button change due to the different mode, add animation background
          CircleButtonAnimationView(animate: $showPortfolio)
        )
      Spacer()
      Text(showPortfolio ? "Portfolio" : "Live prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color.theme.accent)
        .animation(.none)
      Spacer()
      CircleButtonView(iconName: "chevron.right")
        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            showPortfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
  
  private var allCoinsList: some View {
    List {
      ForEach(vm.allCoins, content: { coin in
        CoinRowView(coin: coin, showHoldingsColum: false)
        // set insets for each row
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
      })
    }
    .listStyle(PlainListStyle())
  }
  
  private var portfolioCoinsList: some View {
    List {
      ForEach(vm.portfolioCoins, content: { coin in
        CoinRowView(coin: coin, showHoldingsColum: true)
        // set insets for each row
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
      })
    }
    .listStyle(PlainListStyle())
  }
}
