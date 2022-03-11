//
//  File7.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 07/03/22.
//

import Foundation

public typealias CompletionHandler = (Result<MyResponse, Error>) -> Void
public typealias CompletionData = (statusCode: Int, data: Data)
public typealias CompletionCallBack = (@escaping () throws -> CompletionData) -> Void

public class ApiProvider{
  
public static let shared = ApiProvider()

  public func request(parameters: [AnyHashable: Any], finalUrl: String, completion: @escaping CompletionCallBack){
    let method: String = parameters[Constants.ParametersKeys.method] as! String
    
    let urlStr = "\(Constants.getUrlApi(tipoAmbiente: Constants.tipoAmbiente))\(Constants.apiKey)"
    
    guard let url = URL(string: urlStr) else { return }
    
//    let urlRequest = NSMutableURLRequest(url: url)
//    urlRequest.httpMethod = method
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      do{
          let statusCode = (response as? HTTPURLResponse)?.statusCode
          let myResponse = MyResponse(data: data, error: error, statusCode: statusCode, success: false)
        
          if let error = error {
              completion { try self.handleResponse(myResponse) }
          }
          if let data = data {
              completion { try self.handleResponse(myResponse) }
            
          } else {
              completion { try self.handleResponse(myResponse) }
          }
          
        }
      }
      task.resume()
    }
  
  private func handleResponse(_ myResponse: MyResponse?) throws -> CompletionData!{
    guard let response = myResponse else {
      throw ApiError.emptyResponse
    }
    
    if response.error != nil {
        try self.handlerError(error: response.error!, statuscode: response.statusCode)
    }
    
    switch response.statusCode {
    case 200...299:
        if let data = response.data {
            return (response.statusCode, data)
        }
        
        if response.data != nil && JSONSerialization.isValidJSONObject(response.data as Any), let jsonData = try? JSONSerialization.data(withJSONObject: response.data as Any, options: []) {
            return (response.statusCode, jsonData)
        } else {
            throw ApiError.invalidResponse(response.statusCode)
        }
    default:
        throw ApiError.unknownError(response.statusCode)
    }
    

  }
  
  private func handlerError(error: Error, statuscode: Int) throws  {
      if let errorCode = ApiErrorCode(rawValue: error._code) {
          switch errorCode {
          case .serverErrorStatusCode:
              throw KnownApiFailures.serverErrorStatusCode(error)
          }
      }
      throw ApiError.failure(error, statuscode)
  }
  
  
  
  
}
