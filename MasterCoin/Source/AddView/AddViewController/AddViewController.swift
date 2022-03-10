//
//  AddViewController.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 07/03/22.
//

import UIKit

class AddViewController: UIViewController {
    
    
    var addscreen: AddScreen?
    override func loadView() {
        self.addscreen = AddScreen()
        self.view = self.addscreen
    }

  override func viewDidLoad() {
    super.viewDidLoad()
      
  }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setToolbarHidden(true, animated: false)
    }

}
