//
//  TabBarViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 09/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {
  
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      let listCoin = ListCoinViewController()
      listCoin.title = "Moedas"
      
      
      let manager: AssetManagerProtocol = AssetManager()
      
      manager.requestTrendings(){
        trendingViewModel in
        DataStore.trendingsDataStore.trending = trendingViewModel
        DispatchQueue.main.async {
          listCoin.listCoinView?.tableView.reloadData()
        }
      }failureHandler: { error in
        print("Erro")
        DataStore.trendingsDataStore.trending  = AssetsViewModel()
    }

      let favoriteCoin = FavoritosViewController()
      favoriteCoin.title = "Favoritas"
      self.setViewControllers([listCoin,favoriteCoin], animated: false)
      guard let items = self.tabBar.items else {return}
      let images = ["dollarsign.circle", "star.circle"]
      self.tabBar.barTintColor = .black
      for i in 0...items.count - 1 {
        if #available(iOS 15, *) {
          items[i].image = UIImage(systemName: images[i])
               }
        
      }
    }
}
