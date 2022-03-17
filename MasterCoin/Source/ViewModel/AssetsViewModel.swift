//
//  AssetsViewModel.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation


class AssetsViewModel: ViewModel<AssetModel>{
  
  var asset: [AssetModel]

  
  init(){
    self.asset = [AssetModel]()
    super.init(model: [AssetModel]())
  }
  
  override init(model: [AssetModel]){
    self.asset = model
    super.init(model: model)
  }

}
