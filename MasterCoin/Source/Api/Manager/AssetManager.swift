//
//  AssetManager.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

protocol AssetManagerProtocol: BaseManager{
  func requestTrendings(sucessHandler: @escaping ((AssetsViewModel) -> Void),
                        failureHandler: @escaping ApiProviderFailureHandler)
}

class AssetManager: BaseManager, AssetManagerProtocol{
  
  private var apiProvider: ApiProvider
  
  init(apiProvider: ApiProvider = .shared){
    self.apiProvider = apiProvider
  }
  
  func requestTrendings(sucessHandler: @escaping ((AssetsViewModel) -> Void), failureHandler: @escaping ApiProviderFailureHandler) {
    let parameters: [AnyHashable: Any] = [Constants.ParametersKeys.method: Constants.HTTPMethod.get]
    
    let to = "https://rest-sandbox.coinapi.io/v1/assets/?apikey=3AF89ABC-365F-4966-BA01-6689AAD5F437"
    
    self.apiProvider.sendRequest(to: to,
                                 with: parameters,
                                 expecting: [AssetModel].self) { result in
        
        switch result {
        case .success(let model) :
            let viewModel = AssetsViewModel(model: model)
            
          sucessHandler(viewModel)
        case .failure(let error):
            DebugLogger.log(error)
            
            guard let apiError = error as? ApiError else {
                failureHandler(ApiError.emptyResponse)
                return
            }            
            failureHandler(apiError)
        }
    }
  }
 
}
