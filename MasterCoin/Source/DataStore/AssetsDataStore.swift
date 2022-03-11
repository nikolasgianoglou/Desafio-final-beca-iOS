//
//  AssetsDataStore.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

class AssetsDataStore{
  
  var trending: AssetsViewModel!
  
  init(){
    trending = AssetsViewModel()
  }
  
  convenience init(withTrendingModel trendingModel: [AssetModel]){
    self.init()
    
    trending = AssetsViewModel(model: trendingModel)
  }
  
  func getTrendings(){
    let manager: AssetManagerProtocol = AssetManager()
    
    manager.requestTrendings(){
      trendingViewModel in
      self.trending = trendingViewModel
    }failureHandler: { error in
      print("Erro")
      self.trending = AssetsViewModel()
  }
  
  
}
}
