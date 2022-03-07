//
//  ListCoinCoordinator.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation
import UIKit

class ListCoinCoordinator: Coordinator{

  var navigationController: UINavigationController
  
  init(navigationController: UINavigationController){
    self.navigationController = navigationController
  }
  
  func start() {
    let viewController = ListCoinViewController()
    self.navigationController.pushViewController(viewController, animated: true)
  }
  
  
  
}
