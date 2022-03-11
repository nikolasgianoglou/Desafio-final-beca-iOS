//
//  File10.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation

class ViewModel<T>{
  let model: [T]
  
  init(model: [T]){
    self.model = model
  }
}
