//
//  AssetsDataStore.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

class AssetsDataStore{
  
  var trending: AssetsViewModel!
  var icon: IconViewModel!
  private var whenReadyBlock: ((Result<[IconModel], Error>) -> Void)?
  init(){
    trending = AssetsViewModel()
    icon = IconViewModel()
  }
  
  convenience init(withTrendingModel trendingModel: [AssetModel]){
    self.init()
    
    trending = AssetsViewModel(model: trendingModel)
  }
  
  convenience init(withIconModel assetModel: [IconModel]){
    self.init()
    icon = IconViewModel(model: assetModel)
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
  
  func getAllIcons(completion: @escaping (Result<[IconModel], Error>) -> Void){
    guard let url = URL(string: "https://rest.coinapi.io/v1/assets/icons/55/?apikey=3AF89ABC-365F-4966-BA01-6689AAD5F437") else { return }
    let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
      guard let data = data, error == nil else { return }
      
      do{
        var array = try JSONDecoder().decode([IconModel].self, from: data)
        completion(.success(array))
      }catch{
        print(error)
      }

    }
    task.resume()
  }
  
  
  func getImages(){
    getAllIcons { result in
      switch result{
      case.success(let model):
        self.icon.icons = model
      case .failure(_):
        print("I am so dumb")
      }
    }


  }
}
