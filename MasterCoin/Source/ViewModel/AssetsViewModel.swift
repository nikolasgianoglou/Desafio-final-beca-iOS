//
//  AssetsViewModel.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

class AssetsViewModel: ViewModel<AssetModel>{
  
  var asset: [AssetModel]
//  let asset_id: String
//  let name: String
//  let preco: Float
//  let id_icon: String
//  let volume_1hrs_usd: Double
  
//  init(){
//    self.asset_id = ""
//    self.name = ""
//    self.preco = 0
//    self.id_icon = ""
//    self.volume_1hrs_usd = 0
//    super.init(model: TrendingModel())
//  }
  
  init(){
    self.asset = [AssetModel]()
    super.init(model: [AssetModel]())
  }
  
  override init(model: [AssetModel]){
    self.asset = model
    super.init(model: model)
  }
//  override init(model: TrendingModel) {
//    self.asset_id = model.asset_id
//    self.name = model.name
//    self.preco = model.price_usd
//    self.id_icon = model.id_icon
//    self.volume_1hrs_usd = model.volume_1hrs_usd
//    super.init(model: model)
//  }
  
}
