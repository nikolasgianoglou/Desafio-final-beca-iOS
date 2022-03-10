//
//  FavoritosScreen.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosScreen: UIView {

    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
        collectionView.delaysContentTouches = false
        collectionView.register(FavoritosCollectionViewCell.self, forCellWithReuseIdentifier: FavoritosCollectionViewCell.identifier)
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        collectionView.layer.cornerRadius = 7.5
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        return collectionView
    }()
    
    lazy var logoCoinImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "coin")
        image.tintColor = .orange
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0/255)
        return image

    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview()
        self.configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        self.addSubview(collectionView)
        self.addSubview(logoCoinImageView)
    }
    
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
        
            
            self.logoCoinImageView.topAnchor.constraint(equalTo: self.collectionView.topAnchor, constant: -15),
            self.logoCoinImageView.leadingAnchor.constraint(equalTo: self.collectionView.leadingAnchor, constant: 74),
            self.logoCoinImageView.widthAnchor.constraint(equalToConstant: 33),
            self.logoCoinImageView.heightAnchor.constraint(equalToConstant: 33),
            
            
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 170),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 70),
            collectionView.widthAnchor.constraint(equalToConstant: 100),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            
        ])
    }
}

