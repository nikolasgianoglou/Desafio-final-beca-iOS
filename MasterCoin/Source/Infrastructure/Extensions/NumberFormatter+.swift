//
//  NumberFormatter+.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 12/03/22.
//

import Foundation

extension NumberFormatter{
  static var numberFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.allowsFloats = true
    formatter.numberStyle = .currency
    formatter.formatterBehavior = .default
    return formatter
  }()
}
