//
//  FavoritosView.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosView: UIView {
    
    
    lazy var logoCoinImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "coin")
        image.tintColor = .orange
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0/255)
        return image
        
    }()
    
    var nameCoin = LabelDefault(title: "Bitcoin")
    var abreviationCoin = LabelDefault(title: "BTC")
    var value = LabelDefault(title: "$ 00,000.00")

    override init(frame: CGRect) {
        super.init(frame: frame)
        configuraAddSubView()
        configuraConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuraAddSubView(){
        
        self.addSubview(nameCoin)
        self.addSubview(abreviationCoin)
        self.addSubview(value)
        
    }
        
    func configuraConstraints(){
        
        NSLayoutConstraint.activate([
        
            self.nameCoin.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.nameCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.abreviationCoin.topAnchor.constraint(equalTo: self.nameCoin.bottomAnchor, constant: 10),
            self.abreviationCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.value.topAnchor.constraint(equalTo: self.abreviationCoin.bottomAnchor, constant: 15),
            self.value.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
        
        ])
    }

}

