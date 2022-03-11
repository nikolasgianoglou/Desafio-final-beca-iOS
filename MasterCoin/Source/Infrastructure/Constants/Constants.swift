//
//  File5.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation

enum TipoAmbiente {
    case desenvolvimento
    case sandbox
    case producao
    case local
}

struct Constants{
  static let bundleAppealCopy: Bundle = .current
  
  static let tipoAmbiente: TipoAmbiente = TipoAmbiente.producao
  
  static let apiKey = "apikey=F66BC9E3-1683-4988-BBCD-D684ECDDD6BE"
  static let apiUrlImage55 = "https://rest.coinapi.io/v1/assets/icons/55/"
  
  struct ApiError {
      static let badRequest = 400
      static let emptyResponse = "emptyResponse"
      static let invalidResponse = "invalidResponse"
  }
  
  struct ParametersKeys {
      static let header = "header"
      static let method = "method"
      static let path = "path"
      static let body = "body"
  }
  
  struct HTTPMethod {
      static let get = "GET"
      static let post = "post"
      static let patch = "patch"
  }
  
  struct UrlBase {
      static let local = "https://rest-sandbox.coinapi.io/v1/assets/?"
      static let desenvolvimento = "https://rest.coinapi.io/v1/assets/?"
      static let sandbox = "https://rest-sandbox.coinapi.io/v1/assets/?"
      static let producao = "https://rest.coinapi.io/v1/assets/?"
  }
  
  static func getUrlBase(tipoAmbiente: TipoAmbiente) -> String {
      switch tipoAmbiente {
      case .desenvolvimento:
          return UrlBase.desenvolvimento
      case .sandbox:
          return UrlBase.sandbox
      case .producao:
          return UrlBase.producao
      case .local:
          return UrlBase.local
      }
  }
  
  static func getUrlApi(tipoAmbiente: TipoAmbiente) -> String {
      "\(getUrlBase(tipoAmbiente: tipoAmbiente))"
  }
 
}
