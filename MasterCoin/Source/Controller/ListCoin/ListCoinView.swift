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
    
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    //searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.searchBarStyle = .default
    searchBar.frame = CGRect(x: 0, y: 65, width: (self.bounds.size.width), height: 1)
    searchBar.placeholder = " Search..."
    searchBar.sizeToFit()
    searchBar.barTintColor = .black
    searchBar.isTranslucent = false
    return searchBar
  }()
  
  lazy var topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .black//UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    return view
  }()
    
  let titleLabel = LabelDefault(title: "Moeda Digital")
  let subtitleLabel = LabelDefault(title: "4 jan 2020")
  
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
  
  public func searchBarDelegate(delegate: UISearchBarDelegate){
    searchBar.delegate = delegate
  }
  
  //MARK: - Configure View
  func addSubview() {
    self.addSubview(self.tableView)
    self.addSubview(topView)
    self.addSubview(searchBar)
    self.addSubview(titleLabel)
    self.addSubview(subtitleLabel)
  }
  
  //MARK: - Constraints
  private func setUpConstraints(){
    NSLayoutConstraint.activate([
      self.tableView.topAnchor.constraint(equalTo: self.topView.bottomAnchor),
      self.tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
      self.tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
      self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      topView.topAnchor.constraint(equalTo: self.topAnchor),
      topView.leftAnchor.constraint(equalTo: self.leftAnchor),
      topView.rightAnchor.constraint(equalTo: self.rightAnchor),
      topView.heightAnchor.constraint(equalToConstant: 120),
      
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
      titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
      subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
      
      
    ])
  }

}


