//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
  
  // Since vm holding bitcoin data is heavily used all over the app, make it available as environmentObject
  @StateObject private var vm = HomeViewModel()
  
    var body: some Scene {
        WindowGroup {
          NavigationView {
            HomeView()
              .navigationBarHidden(true)
          }
          .environmentObject(vm)
        }
    }
}
