//
//  SwiftfulCryptoApp.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import SwiftUI

@main
struct SwiftfulCryptoApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            HomeView()
              .navigationBarHidden(true)
          }
        }
    }
}
