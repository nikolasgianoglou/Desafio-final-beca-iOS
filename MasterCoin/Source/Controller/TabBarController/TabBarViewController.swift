//
//  TabBarViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 09/03/22.
//

import UIKit

class TabBarViewController: UITabBarController {
  let listCoin = ListCoinViewController()
  let favoriteCoin = FavoritosViewController()

  var onSelectedCoin: ((_ selectedCoin: AssetModel) -> Void)?
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.isNavigationBarHidden = true
      self.view.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    listCoin.title = "Moedas"
    favoriteCoin.title = "Favoritas"
    self.tabBar.tintColor = UIColor.white
    listCoin.onSelectedCoin = {[weak self] selectedModel in
          self?.onSelectedCoin?(selectedModel)
    }
    
    self.setViewControllers([listCoin,favoriteCoin], animated: false)
    
    guard let items = self.tabBar.items else {return}
    let images = ["dollarsign.square", "star.fill"]
    
    self.tabBar.barTintColor = .black
    for i in 0...items.count - 1 {
      if #available(iOS 15, *) {
        items[i].image = UIImage(systemName: images[i])
             }
    }
  }
}
