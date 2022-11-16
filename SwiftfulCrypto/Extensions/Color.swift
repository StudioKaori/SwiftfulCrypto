//
//  Color.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-16.
//

import Foundation
import SwiftUI

extension Color {
  
  // By adding static let theme to as a Color extension, we can always use ColorTheme
  // If you want to add color theme, you can just add struct and change the theme to the new theme!
  static let theme = ColorTheme()
  
}

struct ColorTheme {
  
  let accent = Color("AccentColor")
  let background = Color("BackgroundColor")
  let green = Color("GreenColor")
  let red = Color("RedColor")
  let secondaryText = Color("SecondaryTextColor")
  
}
