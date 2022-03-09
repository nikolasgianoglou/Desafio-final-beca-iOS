//
//  ViewController.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import UIKit

class ListCoinViewController: UIViewController {

  var listCoin: ListCoinView?
  
  
  override func loadView() {
    self.listCoin = ListCoinView()
    self.view = self.listCoin
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.listCoin?.tableViewDelegates(delegate: self, dataSource: self)
    self.listCoin?.searchBarDelegate(delegate: self)
    self.navigationController?.isNavigationBarHidden = true
    navigationController?.navigationBar.barStyle = .black
  }

}


extension ListCoinViewController: UITableViewDelegate, UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ListCoinTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListCoinTableViewCell.identifier, for: indexPath) as? ListCoinTableViewCell
    return cell ?? ListCoinTableViewCell()
    
  }
}

extension ListCoinViewController: UISearchBarDelegate{
  
}
