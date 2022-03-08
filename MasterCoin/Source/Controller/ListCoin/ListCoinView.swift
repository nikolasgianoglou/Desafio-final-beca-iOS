//
//  ListCoinView.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 08/03/22.
//

import UIKit

class ListCoinView: UIView {

  //MARK: - Components
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .black
    tableView.register(ListCoinTableViewCell.self, forCellReuseIdentifier: ListCoinTableViewCell.identifier)
    return tableView
  }()

  //MARK: - Initializers
  override init (frame: CGRect){
    super.init(frame: frame)
    self.addSubview()
    setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Delegates
  public func tableViewDelegates(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
    self.tableView.delegate = delegate
    self.tableView.dataSource = dataSource
  }
  
  //MARK: - Configure View
  func addSubview() {
    self.addSubview(self.tableView)
  }
  
  //MARK: - Constraints
  private func setUpConstraints(){
    NSLayoutConstraint.activate([
      self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
      self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
      self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
  }

}
