//
//  AddViewController.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 07/03/22.
//

import UIKit

class AddViewController: UIViewController {
    
    
  var selectedAsset: (() -> Void)?
  
  var addscreen: AddScreen = {
    let view = AddScreen()
    return view
  }()
    override func loadView() {
        self.view = self.addscreen
    }
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    //self.addscreen.delegate(delegate: self)
    addscreen.addOrRemoveFavoriteCoin = {
      self.selectedAsset?()
      }

  }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = "Voltar"
        self.navigationController?.navigationBar.tintColor = .white
    }
}
