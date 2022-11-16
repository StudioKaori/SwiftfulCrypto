//
//  HomeView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct HomeView: View {
  
  @State private var showPortfolio: Bool = false
  
  var body: some View {
    ZStack {
      // background layer
      Color.theme.background
        .ignoresSafeArea()
      
      // content layer
      VStack {
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
  }
}
