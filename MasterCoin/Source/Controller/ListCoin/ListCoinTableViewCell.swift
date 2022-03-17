//
//  ListCoinTableViewCell.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 08/03/22.
//

import UIKit

class ListCoinTableViewCell: UITableViewCell {


  static let identifier: String = "ListCoinTableViewCell"
  
  //MARK: - Initializers
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.contentView.backgroundColor = UIColor(red: 26/255, green: 28/255, blue: 29/255, alpha: 1.0)
    self.addSubview()
    configConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Components
    lazy var coinImageView: UIImageView = {
      let image = UIImageView()
      image.image = UIImage(named: "coin")
      image.translatesAutoresizingMaskIntoConstraints = false
      //image.backgroundColor = .red
      image.contentMode = .scaleAspectFill
      return image
    }()
  
    lazy var starImage: UIImageView = {
      let image = UIImageView()
      image.translatesAutoresizingMaskIntoConstraints = false
      if #available(iOS 13.0, *) {
        image.image = UIImage(systemName: "star.fill")
      } else {
      }
      //image.backgroundColor = .red
      image.contentMode = .scaleAspectFit
      image.isHidden = true
      return image
    }()

    let nameLabel = LabelDefault(title: "Bitcoin")
    let abreviationLabel = LabelDefault(title: "BTC")
    let valueLabel = LabelDefault(title: "R$ 3100000")
  
  
      func addSubview() {
        self.contentView.addSubview(self.coinImageView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.abreviationLabel)
        self.contentView.addSubview(self.valueLabel)
        self.contentView.addSubview(starImage)
      }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func configureCell(with model: AssetModel){
    nameLabel.text = model.name
    let priceString = NumberFormatter.numberFormatter.string(from: NSNumber(value: model.price_usd ?? 0))
    valueLabel.text = priceString
    abreviationLabel.text = model.asset_id
    coinImageView.load(assetId: model.asset_id)
    starImage.isHidden = !(model.isFavorite ?? false)
  }
  
  //MARK: - Constraints
  private func configConstraints(){
    NSLayoutConstraint.activate([
      self.coinImageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 5),
      self.coinImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      self.coinImageView.widthAnchor.constraint(equalToConstant: 35),
      self.coinImageView.heightAnchor.constraint(equalToConstant: 35),
      
      self.nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
      self.nameLabel.leftAnchor.constraint(equalTo: self.coinImageView.rightAnchor,constant: 10),
      
      self.abreviationLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 5),
      self.abreviationLabel.leftAnchor.constraint(equalTo: self.nameLabel.leftAnchor),
      
      self.valueLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -10),
      self.valueLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      
      self.starImage.bottomAnchor.constraint(equalTo: self.nameLabel.bottomAnchor),
      self.starImage.leftAnchor.constraint(equalTo: self.nameLabel.rightAnchor, constant: 8),
      self.starImage.widthAnchor.constraint(equalToConstant: 10),
      self.starImage.heightAnchor.constraint(equalToConstant: 10),
      
    ])
  }

}
