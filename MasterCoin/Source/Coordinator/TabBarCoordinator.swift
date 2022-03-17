//
//  TabBarCoordinator.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 14/03/22.
//

import Foundation
import UIKit

class TabBarCoordinator: Coordinator{
  var navigationController: UINavigationController
  let viewController = TabBarViewController()
  init(navigationController: UINavigationController){
    self.navigationController = navigationController
  }
  
  func start() {
    
    let manager: AssetManagerProtocol = AssetManager()
    
    DataStore.trendingsDataStore.getImages()
    
    manager.requestTrendings(){
      trendingViewModel in
      DataStore.trendingsDataStore.trending = trendingViewModel
      self.viewController.listCoin.listCoinView?.assetViewModel = DataStore.trendingsDataStore.trending.asset
      DispatchQueue.main.async {
        self.viewController.listCoin.listCoinView?.tableView.reloadData()
      }
    }failureHandler: { error in
      print("Erro")
      DataStore.trendingsDataStore.trending  = AssetsViewModel()
    }
    
    viewController.onSelectedCoin = {model in
      self.goToAddView(model: model)
    }
    self.navigationController.pushViewController(viewController, animated: true)
    
    
  }
  
  
  private func goToAddView(model: AssetModel?){
    if var viewModel = model{
      
      let coordinator = AddViewCoordinator(navigationController: self.navigationController,model: viewModel)
      coordinator.coordinatorAdd = { model in
          if !self.viewController.favoriteCoin.modelTest.contains(where: {$0.asset_id == model.asset_id}){
            self.viewController.favoriteCoin.modelTest.append(model)
            model.isFavorite = true
          }else{
            model.isFavorite = false
            self.viewController.favoriteCoin.modelTest = self.viewController.favoriteCoin.modelTest.filter { $0.asset_id != model.asset_id}
            }
            
            
          }
        
      coordinator.start()
      }
        
    }
    
}

