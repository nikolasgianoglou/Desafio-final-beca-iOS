//
//  File8.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation
struct AssetModel: Codable{
  let asset_id: String
  let name: String?
  let price_usd: Double?
  let id_icon: String?
  let volume_1hrs_usd: Double?
  let volume_1day_usd: Double?
  let volume_1mth_usd: Double?
  
  init(){
    asset_id = ""
    name = ""
    price_usd = 0
    id_icon = ""
    volume_1hrs_usd = 0
    volume_1day_usd = 0
    volume_1mth_usd = 0
  }
}

struct IconModel: Decodable{
  let asset_id: String?
  let url: String?
  
  init(){
    asset_id = ""
    url = ""
  }
}


extension URLSession{
  fileprivate func decodableTask<T: Decodable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void)
  -> URLSessionDataTask {
    return self.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else{
        completionHandler(nil, response, error)
        return
      }
      completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
    }
  }
  
  func TrendingModelTask(with url: URL, completionHandler: @escaping (AssetModel?, URLResponse?, Error?) -> Void) -> URLSessionDataTask{
    return self.decodableTask(with: url, completionHandler: completionHandler)
  }
  
}
