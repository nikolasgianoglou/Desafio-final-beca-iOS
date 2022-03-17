//
//  LocalizableStrings.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 17/03/22.
//

import Foundation
import UIKit

enum LocalizableStrings: String {
    
    case titleLabel
    case nameLabel
    case abreviationLabel
    case valueLabel
    
    
    
    func localize() -> String {
        rawValue.localizeInCurrentBundle()
    }
}

extension Bundle {
    
    static var curren: Bundle {
        class DummyClass{
            init(){
                
            }
        }
        
        return Bundle(for: DummyClass.self)
    }
}


extension String {
    
    func localizeInCurrentBundle(_ accessibility: Bool = false) -> String{
        
        let path: Bundle = .curren
        
        
        return NSLocalizedString(self, tableName: accessibility ? "MasterCoinAccessibilityLocalizable": "MasterCoinLocalizable", bundle: path, value: String(), comment: String())
        
    }
}
