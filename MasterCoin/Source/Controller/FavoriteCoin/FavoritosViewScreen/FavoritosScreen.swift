//
//  FavoritosScreen.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosScreen: UIView {

  let date = Date()
  
  var titleLabel = LabelDefault(title: "Moeda Digital")
  var subtitleLabel = LabelDefault(title: "")
  
  var view : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.translatesAutoresizingMaskIntoConstraints = false
    cv.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    cv.register(FavoritosCollectionViewCell.self, forCellWithReuseIdentifier: "FavoritosCollectionViewCell")
    return cv
    
  }()
    
  override init(frame: CGRect) {
      super.init(frame: frame)
      self.addSubview()
      self.configuraConstraints()
    
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "dd.MM.YYYY"
      let dateText = dateFormatter.string(from: date)
      subtitleLabel.text = dateText
  }
  
  required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  func addSubview() {
    self.addSubview(view)
    view.addSubview(titleLabel)
    view.addSubview(subtitleLabel)
    view.addSubview(collectionView)
    
  }
  
  //MARK: - Constraints
  
  func configuraConstraints(){
    
    
//
//    self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
//    self.titleLabel.textAlignment = .center
//    self.titleLabel.backgroundColor = .yellow
//    self.titleLabel.textColor = .black
    NSLayoutConstraint.activate([
      
//
      view.topAnchor.constraint(equalTo: self.topAnchor),
      view.leftAnchor.constraint(equalTo: self.leftAnchor),
      view.rightAnchor.constraint(equalTo: self.rightAnchor),
      view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
      titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      
      subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      subtitleLabel.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor),
      
      collectionView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 15),
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
      collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
      
      

    ])
  }  
}

