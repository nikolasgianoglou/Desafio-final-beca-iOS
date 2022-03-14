//
//  ViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import UIKit

class ListCoinViewController: UIViewController {

  var listCoinView: ListCoinView?
  var onSelectedCoin: ((_ selectedCoin: AssetModel) -> Void)?
  
  override func loadView() {
    self.listCoinView = ListCoinView()
    self.view = self.listCoinView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.isNavigationBarHidden = true
    navigationController?.navigationBar.barStyle = .black
    
    listCoinView?.onSelectedModel = {[weak self] selectedModel in
          self?.onSelectedCoin?(selectedModel)
    }
  }

}

