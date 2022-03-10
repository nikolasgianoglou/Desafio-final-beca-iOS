//
//  FavoritosView.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 10/03/22.
//

import UIKit

class FavoritosView: UIView {
        
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
            
            
           
        
            self.nameCoin.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.nameCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor,  constant: 50),
            
            self.abreviationCoin.topAnchor.constraint(equalTo: self.nameCoin.bottomAnchor, constant: 10),
            self.abreviationCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 50),
            
            self.value.topAnchor.constraint(equalTo: self.abreviationCoin.bottomAnchor, constant: 10),
            self.value.centerXAnchor.constraint(equalTo: self.centerXAnchor,  constant: 50),
            
        ])
    }

}

