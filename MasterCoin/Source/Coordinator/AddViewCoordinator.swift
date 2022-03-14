//
//  AddViewCoordinator.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 14/03/22.
//

import Foundation
import UIKit

class AddViewCoordinator: Coordinator{

  var navigationController: UINavigationController
  let assetModel: AssetModel
  
  init(navigationController: UINavigationController, model: AssetModel){
    self.navigationController = navigationController
    self.assetModel = model
  }
  
  func start() {
    let viewController = AddViewController()
    viewController.addscreen.setLabels(assetModel: assetModel)
    self.navigationController.pushViewController(viewController, animated: true)
  }
}
