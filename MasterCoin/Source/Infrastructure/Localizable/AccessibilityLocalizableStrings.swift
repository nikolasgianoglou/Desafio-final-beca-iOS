//
//  AccessibilityLocalizableStrings.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 17/03/22.
//

import Foundation
import UIKit

enum AccessibilityLocalizableStrings: String {
    
    case titleLabel
    case nameLabel
    case abreviationLabel
    case valueLabel
    
    
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle(true)
    }
}
