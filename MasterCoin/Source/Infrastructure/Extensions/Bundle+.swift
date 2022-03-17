//
//  File3.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation

extension Bundle {
    
    
    static var current: Bundle {
        class DummyClass {
            init() {
                
            }
        }
        return Bundle(for: DummyClass.self)
    }
}
