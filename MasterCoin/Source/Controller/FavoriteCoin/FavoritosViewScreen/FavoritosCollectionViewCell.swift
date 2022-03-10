//
//  FavoritosCollectionViewCell.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FavoritosCollectionViewCell"
    let favoritosview = FavoritosView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.addSubview(favoritosview)
        self.configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
 
            self.favoritosview.topAnchor.constraint(equalTo: self.topAnchor),
            self.favoritosview.leftAnchor.constraint(equalTo: self.leftAnchor),
            self.favoritosview.rightAnchor.constraint(equalTo: self.rightAnchor),
            self.favoritosview.bottomAnchor.constraint(equalTo: self.bottomAnchor),

        
        ])
    }
}
