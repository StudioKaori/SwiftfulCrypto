//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by Kaori Persson on 2022-11-17.
//

import Foundation

extension Double {
  
  /// Converts a Double into a Currency with 2-6 decimal places
  /// ```
  /// Convert 1234.56 to $1,234.56
  /// Convert 12.3456 to $12.3456
  /// Convert 0.123456 to $0.123456
  /// ```
  private var currencyFormatter: NumberFormatter {
    let formatter = NumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.numberStyle = .currency
//    formatter.locale = .current // <- default currency
//    formatter.currencyCode = "usd" // <- change currency
//    formatter.currencySymbol = "$" // <- change currency symbol
    formatter.minimumFractionDigits = 2
    formatter.maximumFractionDigits = 6
    return formatter
  }
  
  /// Converts a Double into a Currency as a String with 2-6 decimal places
  /// ```
  /// Convert 1234.56 to "$1,234.56"
  /// Convert 12.3456 to "$12.3456"
  /// Convert 0.123456 to "$0.123456"
  /// ```
  func asCurrencyWithDecimals() -> String {
    let number = NSNumber(value: self)
    return currencyFormatter.string(from: number) ?? "$0.00"
  }
  
  /// Converts a Double into String representation
  /// ```
  /// Convert 1.23456 to "1.23"
  /// ```
  func asNumberString() -> String {
    return String(format: "%.2f", self)
  }
  
  /// Converts a Double into String representation with percent symbol
  /// ```
  /// Convert 1.23456 to "1.23%"
  /// ```
  func asPercentString() -> String {
    return asNumberString() + "%"
  }
}
