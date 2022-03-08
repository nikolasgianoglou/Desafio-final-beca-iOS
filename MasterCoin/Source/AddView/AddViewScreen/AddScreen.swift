//
//  AddScreen.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 07/03/22.
//

import UIKit

class AddScreen: UIView {

    lazy var coinValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "R$ 31,010.20"
        return label
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
    
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true // arredondando botao
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor // borda branca ao botao
        button.layer.cornerRadius = 7.5
        button.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
        
        return button
    }()
    
   override init(frame: CGRect) {
       super.init(frame: frame)
       self.configuracoesDeBackground() // cor de fundo
       self.configuracoesDeSuperView() // elementos
       self.setUpConstraint()
    }
    
    
    private func configuracoesDeBackground(){
        self.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
        
    }
    
    private func configuracoesDeSuperView(){
        self.addSubview(self.coinValueLabel)
        self.addSubview(self.logoCoinImageView)
        self.addSubview(self.addButton)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraint(){
        
        NSLayoutConstraint.activate([
            
            //Image Coin Constraint
            self.logoCoinImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.logoCoinImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Coin Value Constraint
            self.coinValueLabel.topAnchor.constraint(equalTo: self.logoCoinImageView.bottomAnchor,constant: -50),
            self.coinValueLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 85),
            self.coinValueLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 100),
            self.coinValueLabel.heightAnchor.constraint(equalToConstant: 150),
            
            //Button Constraint
            self.addButton.topAnchor.constraint(equalTo: self.coinValueLabel.bottomAnchor, constant: -50),
            self.addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            self.addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            self.addButton.heightAnchor.constraint(equalToConstant: 45)
            
            
        ])
    }
}

