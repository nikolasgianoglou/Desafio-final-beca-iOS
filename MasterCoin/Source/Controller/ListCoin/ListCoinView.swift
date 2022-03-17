//
//  ListCoinView.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 08/03/22.
//

import UIKit

class ListCoinView: UIView {
  
  var assetViewModel: [AssetModel]?
  var data: [AssetModel]?
  var filteredData = [AssetModel]()
  var isSearch = false
  
  let date = Date()
  var onSelectedModel: ((_ selectedCoin: AssetModel) -> Void)?
  //MARK: - Components
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.backgroundColor = .black
    tableView.register(ListCoinTableViewCell.self, forCellReuseIdentifier: ListCoinTableViewCell.identifier)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    return tableView
  }()
    
  lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    //searchBar.translatesAutoresizingMaskIntoConstraints = false
    searchBar.searchBarStyle = .default
    searchBar.frame = CGRect(x: 0, y: 65, width: (self.bounds.size.width), height: 1)
    searchBar.placeholder = " Search..."
    searchBar.sizeToFit()
    searchBar.barTintColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    searchBar.isTranslucent = false
    searchBar.delegate = self
    return searchBar
  }()
  
  lazy var topView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    return view
  }()
    
  let titleLabel = LabelDefault(title: "Moeda Digital")
  let subtitleLabel = LabelDefault(title: "Teste")
  
  //MARK: - Initializers
  override init (frame: CGRect){
    super.init(frame: frame)
    self.addSubview()
    setUpConstraints()
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.YYYY"
    let dateText = dateFormatter.string(from: date)
    subtitleLabel.text = dateText
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
   
  //MARK: - Delegates
  public func tableViewDelegates(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
    self.tableView.delegate = delegate
    self.tableView.dataSource = dataSource
  }

//  public func searchBarDelegate(delegate: UISearchBarDelegate){
//    searchBar.delegate = delegate
//  }
  
  func loadData() -> [AssetModel]{
    return DataStore.trendingsDataStore.trending.asset
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


extension ListCoinView: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return isSearch ? self.filteredData.count : self.assetViewModel?.count ?? 0
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: ListCoinTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ListCoinTableViewCell.identifier, for: indexPath) as? ListCoinTableViewCell
    
    if isSearch{
      cell?.configureCell(with: filteredData[indexPath.row])
    }else{
      let selectedAsset = assetViewModel?[indexPath.row]
      cell?.configureCell(with: selectedAsset!)
    }

    return cell ?? ListCoinTableViewCell()
  }
}

extension ListCoinView: UITableViewDelegate{
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedCoin = assetViewModel?[indexPath.row]
    onSelectedModel?(selectedCoin!)
  }
  
}

extension ListCoinView: UISearchBarDelegate{
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
             isSearch = true
      }
         
      func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
             searchBar.resignFirstResponder()
             isSearch = false
      }
         
      func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
             searchBar.resignFirstResponder()
             isSearch = false
      }
         
      func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
             searchBar.resignFirstResponder()
             isSearch = false
      }
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          if searchText.count == 0 {
              isSearch = false
              self.tableView.reloadData()
          } else {
            filteredData = DataStore.trendingsDataStore.trending.asset.filter({ (text) -> Bool in
              let tmp: NSString = text.name as! NSString
              let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
              return range.location != NSNotFound
              })
              if(filteredData.count == 0){
                  isSearch = false
              } else {
                  isSearch = true
              }
              self.tableView.reloadData()
          }
      }
}
