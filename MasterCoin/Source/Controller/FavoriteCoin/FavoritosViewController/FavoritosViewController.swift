//
//  FavoritosViewController.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    
  //var label = UIView()
  var modelTest: [AssetModel] = [AssetModel]()
  var favoritosscreen: FavoritosScreen = {
    let teste = FavoritosScreen(frame:.zero)
    teste.backgroundColor = .white
    return teste
  }()
  
  
  override func loadView() {
    self.view = self.favoritosscreen
  }

override func viewWillAppear(_ animated: Bool) {
  super.viewWillAppear(animated)
  for a in modelTest{
    print(a.name)
  }
}
  
  override func viewDidLoad() {
      super.viewDidLoad()
      self.favoritosscreen.collectionView.delegate = self
      self.favoritosscreen.collectionView.dataSource = self
     
  }
}

extension FavoritosViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: favoritosscreen.collectionView.frame.width/2.5, height: favoritosscreen.collectionView.frame.width/2)
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return modelTest.count
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = favoritosscreen.collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritosCollectionViewCell", for: indexPath) as! FavoritosCollectionViewCell
    cell.setUpLabels(with: modelTest[indexPath.row])
    favoritosscreen.collectionView.reloadData()
    return cell
    
  }
  
  
}

