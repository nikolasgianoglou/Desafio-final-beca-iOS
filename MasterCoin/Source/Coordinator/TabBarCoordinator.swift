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
  
  init(navigationController: UINavigationController){
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = TabBarViewController()
    let manager: AssetManagerProtocol = AssetManager()
    
    DataStore.trendingsDataStore.getImages()
    
    manager.requestTrendings(){
      trendingViewModel in
      DataStore.trendingsDataStore.trending = trendingViewModel
      DispatchQueue.main.async {
        viewController.listCoin.listCoinView?.tableView.reloadData()
      }
    }failureHandler: { error in
      print("Erro")
      DataStore.trendingsDataStore.trending  = AssetsViewModel()
    }
    
    self.navigationController.pushViewController(viewController, animated: true)
  }
}
