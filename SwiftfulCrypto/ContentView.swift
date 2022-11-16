//
//  ContentView.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
          Color.theme.background
            .ignoresSafeArea()
          
          VStack {
            Text("Accent")
              .foregroundColor(Color.theme.accent)
            
            Text("Second")
              .foregroundColor(Color.theme.secondaryText)
            
            Text("Red")
              .foregroundColor(Color.theme.red)
            
            Text("Green")
              .foregroundColor(Color.theme.green)
          }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
