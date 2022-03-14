//
//  ViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import UIKit

class ListCoinViewController: UIViewController {

  var listCoinView: ListCoinView?
  
  
  override func loadView() {
    self.listCoinView = ListCoinView()
    self.view = self.listCoinView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
      
    //self.listCoin?.tableViewDelegates(delegate: self, dataSource: self)
    //self.listCoin?.searchBarDelegate(delegate: self)
    self.navigationController?.isNavigationBarHidden = true
    navigationController?.navigationBar.barStyle = .black
    listCoinView?.onVoltar = {

        self.navigationController?.pushViewController(AddViewController(), animated: true)

    }
  }

}

