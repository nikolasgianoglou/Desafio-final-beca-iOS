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

class IconViewModel: ViewModel<IconModel>{
  var icons: [IconModel]
  
  init(){
    self.icons = [IconModel]()
    super.init(model: [IconModel]())
  }
  
  override init(model: [IconModel]){
    self.icons = model
    super.init(model: model)
  }
  
}
