//
//  AddScreen.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 07/03/22.
//

import UIKit

class AddScreen: UIView {

    // MARK: - Valor Moeda
    lazy var coinValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "$ 00,000.00"
        return label
    }()

    // MARK: - Imagem Moeda
    lazy var logoCoinImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "coin")
        image.tintColor = .orange
        image.contentMode = .scaleAspectFit
        image.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0/255)
        return image
        
    }()
    
    // MARK: - Botão adiconar
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
        button.addTarget(self, action: #selector(self.onClickAddButton), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - View da Lista
    lazy var listView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
        view.sizeToFit()
        
        return view
    }()
    // MARK: - Volumes Negociaveis
    lazy var volumesNegociaveis: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 20)
       label.text = " volumes negociados "
        
       return label
    }()
    
    
    lazy var lastHour: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = " última hora "
        
       return label
    }()
    
    
    lazy var lastMonth: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = " última mês "
        
       return label
    }()
    
    
    lazy var lastYear: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = " última ano "
        
       return label
    }()
    
    
    lazy var lastHourCoin: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = "$ 00,000.00"
        
       return label
    }()
    
    
    lazy var lastMonthCoin: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = "$ 00,000.00"
        
       return label
    }()
    
    
    lazy var lastYearCoin: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.textColor = .white
       label.font = UIFont.systemFont(ofSize: 17)
       label.text = "$ 00,000.00"
        
       return label
    }()
    
    
   override init(frame: CGRect) {
       super.init(frame: frame)
       self.configuracoesDeBackground() // cor de fundo
       self.configuracoesDeSuperView() // elementos
       self.setUpConstraint() //constraint
       
    }
    
    private func configuracoesDeBackground(){
        self.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
        
    }
    
    private func configuracoesTopBar(){
        
    }
    
    private func configuracoesDeSuperView(){
        self.addSubview(self.coinValueLabel)
        self.addSubview(self.logoCoinImageView)
        self.addSubview(self.addButton)
        self.addSubview(self.listView)
        self.addSubview(self.volumesNegociaveis)
        
        //Datas View Preta
        self.addSubview(self.lastHour)
        self.addSubview(self.lastMonth)
        self.addSubview(self.lastYear)
        
        //Dinheiro View Preta
        self.addSubview(self.lastHourCoin)
        self.addSubview(self.lastMonthCoin)
        self.addSubview(self.lastYearCoin)
        

    }
    
    @objc private func onClickAddButton(){
        print("Adicinou uma moeda aos favoritos")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Constraint
    private func setUpConstraint(){
        
        NSLayoutConstraint.activate([
            
            //Image Coin Constraint
            self.logoCoinImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.logoCoinImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Coin Value Constraint
            self.coinValueLabel.topAnchor.constraint(equalTo: self.logoCoinImageView.bottomAnchor,constant: -55),
            self.coinValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.coinValueLabel.heightAnchor.constraint(equalToConstant: 150),
            
            //Button Constraint
            self.addButton.topAnchor.constraint(equalTo: self.coinValueLabel.bottomAnchor, constant: -10),
            self.addButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.addButton.widthAnchor.constraint(equalToConstant: 250),
            self.addButton.heightAnchor.constraint(equalToConstant: 45),
            
            //List View
            self.listView.topAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 40),
            self.listView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -30),
            self.listView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10),
            self.listView.heightAnchor.constraint(equalToConstant: 1000),
            
            //Volumes Negociaveis
            self.volumesNegociaveis.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 20),
            self.volumesNegociaveis.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Última Hora
            self.lastHour.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 80),
            self.lastHour.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //Último mês
            self.lastMonth.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 130),
            self.lastMonth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //Último ano
            self.lastYear.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 180),
            self.lastYear.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        
            //Última Hora Moeda/Dinheiro
            self.lastHourCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 80),
            self.lastHourCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            //Último mês Moeda/Dinheiro
            self.lastMonthCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 130),
            self.lastMonthCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            //Último ano Moeda/Dinheiro
            self.lastYearCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 180),
            self.lastYearCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
        ])
    }
}
