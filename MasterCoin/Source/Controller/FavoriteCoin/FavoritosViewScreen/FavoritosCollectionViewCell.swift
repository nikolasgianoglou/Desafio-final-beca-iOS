//
//  FavoritosCollectionViewCell.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {
    
  static let identifier = "FavoritosCollectionViewCell"
    //let favoritosview = FavoritosView()
  
  var nameCoin = LabelDefault(title: "BTC")
  var abreviationCoin = LabelDefault(title: "BTC")
  var value = LabelDefault(title: "$ 0.00")
  
  
    override init(frame: CGRect) {
      super.init(frame: frame)
      self.contentView.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
      self.contentView.layer.cornerRadius = 7.5
      addSubView()
      self.configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  func addSubView(){
    self.contentView.addSubview(nameCoin)
    self.contentView.addSubview(abreviationCoin)
    self.contentView.addSubview(value)
    //self.contentView.addSubview(abreviationCoin)
    //self.contentView.addSubview(value)
  }
  
  func setUpLabels(with model: AssetModel){
    nameCoin.text = model.name
    abreviationCoin.text = model.asset_id
    value.text = NumberFormatter.numberFormatter.string(from: NSNumber(value: model.price_usd ?? 0))
  }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
          
          self.nameCoin.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 20),
          self.nameCoin.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
          
          self.abreviationCoin.topAnchor.constraint(equalTo: nameCoin.bottomAnchor, constant: 10),
          self.abreviationCoin.centerXAnchor.constraint(equalTo: nameCoin.centerXAnchor),
          
          self.value.topAnchor.constraint(equalTo: abreviationCoin.bottomAnchor, constant: 10),
          self.value.centerXAnchor.constraint(equalTo: abreviationCoin.centerXAnchor)
        ])
    }
}
