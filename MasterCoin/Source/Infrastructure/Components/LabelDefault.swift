//
//  File6.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import UIKit

class LabelDefault: UILabel {

  init (title: String) {
      super.init(frame: .zero)
      initDefault()
      
      self.text = title
  }
  
  init (title: String, numberOfLines: Int, lineBreakMode: NSLineBreakMode) {
      super.init(frame: .zero)
      initDefault()
      
      self.text = title
      self.numberOfLines = numberOfLines
      self.lineBreakMode = lineBreakMode
  }
  
  private func initDefault() {
      self.translatesAutoresizingMaskIntoConstraints = false
      self.font = UIFont.systemFont(ofSize: 14, weight: .regular)
      self.textColor = .white
  }
  
  required public init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

}
