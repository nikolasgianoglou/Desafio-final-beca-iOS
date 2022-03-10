//
//  FavoritosViewController.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosViewController: UIViewController {
    
    var favoritosscreen: FavoritosScreen!
    override func loadView() {
       self.favoritosscreen = FavoritosScreen()
        self.view = self.favoritosscreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuraConstraints()
        self.favoritosscreen?.collectionView.delegate = self
        self.favoritosscreen?.collectionView.dataSource = self

    }
    
    func configuraConstraints(){
        favoritosscreen?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            self.favoritosscreen.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.favoritosscreen.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.favoritosscreen.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.favoritosscreen.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            

        ])
    }
}

extension FavoritosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritosCollectionViewCell.identifier, for: indexPath) as? FavoritosCollectionViewCell
        
        return cell!
    }
    
}

extension FavoritosViewController: UICollectionViewDelegate {
    
}

