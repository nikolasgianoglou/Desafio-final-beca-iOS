//
//  AddScreen.swift
//  MasterCoin
//
//  Created by Bruna Silva Borges on 07/03/22.
//

import UIKit

protocol AddScreenProtocol:class{
    func actionAddButton()
}


class AddScreen: UIView {
    
    
    weak var delegate: AddScreenProtocol?
    
    func delegate(delegate:AddScreenProtocol?){
        self.delegate = delegate
    }
    
  
    
    //MARK: - Labels

    //Letters
    var volumesNegociaveis = LabelDefault(title: "volumes negociados")
    var lastHour = LabelDefault(title: "última hora")
    var lastDay = LabelDefault(title: "último dia")
    var lastMonth = LabelDefault(title: "último mes")
    var nameCoin = LabelDefault(title: "BTC")
    
    //Numbers
    var coinValueLabel = LabelDefault(title: "$ 00,000.00")
    var lastHourCoin = LabelDefault(title: "$ 00,000.00")
    var lastDayCoin = LabelDefault(title: "$ 00,000.00")
    var lastMonthCoin = LabelDefault(title: "$ 00,000.00")
    
    
    
    
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
    
   override init(frame: CGRect) {
       super.init(frame: frame)
       self.configuracoesDeBackground() // cor de fundo
       self.configuracoesDeSuperView() // elementos
       self.setUpConstraint() //constraint
       self.configuracoesLabel()
       
    }
    
    private func configuracoesDeBackground(){
        self.backgroundColor = UIColor(red: 141/255, green: 149/255, blue: 98/255, alpha: 1.0)
        
    }
    //MARK: - Função das Labels
    private func configuracoesLabel(){
        
        //Letters
        volumesNegociaveis.font = UIFont.systemFont(ofSize: 25)
        nameCoin.font = UIFont.boldSystemFont(ofSize: 20)
        lastHour.font = UIFont.systemFont(ofSize: 17)
        lastDay.font = UIFont.systemFont(ofSize: 17)
        lastDay.font = UIFont.systemFont(ofSize: 17)
        

        //Numbers
        coinValueLabel.font = UIFont.systemFont(ofSize: 25)
        lastHourCoin.font = UIFont.systemFont(ofSize: 17)
        lastDayCoin.font = UIFont.systemFont(ofSize: 17)
        lastMonthCoin.font = UIFont.systemFont(ofSize: 17)
    }
    
    //MARK: - Função das Constraints
    private func configuracoesDeSuperView(){
        
        //Constraints View verde
        self.addSubview(self.coinValueLabel)
        self.addSubview(self.logoCoinImageView)
        self.addSubview(self.addButton)
        self.addSubview(self.listView)
        self.addSubview(self.volumesNegociaveis)
        self.addSubview(self.nameCoin)
        
        //Datas View Preta
        self.addSubview(self.lastHour)
        self.addSubview(self.lastDay)
        self.addSubview(self.lastMonth)
        
        //Dinheiro View Preta
        self.addSubview(self.lastHourCoin)
        self.addSubview(self.lastDayCoin)
        self.addSubview(self.lastMonthCoin)
        

    }
    
    @objc private func onClickAddButton(){
        self.delegate?.actionAddButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    func setLabels(assetModel: AssetModel){
      nameCoin.text = assetModel.asset_id
      lastHourCoin.text = String(format:"%.2f",assetModel.volume_1hrs_usd ?? "")
      lastDayCoin.text = String(format:"%.2f",assetModel.volume_1day_usd ?? "")
      lastMonthCoin.text = String(format:"%.2f",assetModel.volume_1mth_usd ?? "")
      coinValueLabel.text = String(format:"%.2f",assetModel.price_usd ?? "")
      logoCoinImageView.load(assetId: assetModel.asset_id)
    }
    
    
    //MARK: - Constraint
    private func setUpConstraint(){
        
        NSLayoutConstraint.activate([
            
            self.nameCoin.topAnchor.constraint(equalTo: self.topAnchor, constant: 40),
            self.nameCoin.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            
            //Image Coin Constraint
            self.logoCoinImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            self.logoCoinImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoCoinImageView.widthAnchor.constraint(equalToConstant: 50),
            self.logoCoinImageView.heightAnchor.constraint(equalToConstant: 50),
            
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
            self.listView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.listView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.listView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            //Volumes Negociaveis
            self.volumesNegociaveis.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 20),
            self.volumesNegociaveis.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            //Última Hora
            self.lastHour.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 80),
            self.lastHour.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //Último mês
            self.lastDay.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 130),
            self.lastDay.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            
            //Último ano
            self.lastMonth.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 180),
            self.lastMonth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
        
            //Última Hora Moeda/Dinheiro
            self.lastHourCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 80),
            self.lastHourCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            //Último dia Moeda/Dinheiro
            self.lastDayCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 130),
            self.lastDayCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            //Último mes Moeda/Dinheiro
            self.lastMonthCoin.topAnchor.constraint(equalTo: self.listView.topAnchor, constant: 180),
            self.lastMonthCoin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
        ])
    }
}

