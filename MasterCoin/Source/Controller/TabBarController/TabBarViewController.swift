//
//  TabBarViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 09/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
      super.viewDidLoad()
      let listCoin = ListCoinViewController()
      listCoin.title = "Moedas"
      let favoriteCoin = FavoriteCoinViewController()
      favoriteCoin.title = "Adicionadas"
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
