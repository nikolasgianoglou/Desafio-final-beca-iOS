//
//  ImageView+.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 14/03/22.
//

import Foundation
import UIKit
extension UIImageView {
  func load(assetId: String) {
        let imageViewModel = DataStore.trendingsDataStore.icon
    let urlString = imageViewModel?.icons.filter { icon in
      icon.asset_id == assetId
    }.first?.url ?? ""
    
      if let url = URL(string: urlString){
          let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView.init(style: .gray)
            
            addSubview(activityIndicator)
            activityIndicator.color = .yellow
            
            activityIndicator.startAnimating()
            activityIndicator.center = self.center
            
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                            activityIndicator.removeFromSuperview()
                        }
                    }
                }
            }
        }
    }
  
}
