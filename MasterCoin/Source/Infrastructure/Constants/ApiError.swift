//
//  ApiError.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

public enum ApiErrorCode: Int {
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case tooManyRequests = 429
    case NoData = 550
}

public enum KnownApiFailures: Error {
  
  case thereIsSomethingWrongWithYourRequest(Error)
  case youAPIKeyIsWrong(Error)
  case yourAPIKeyDoesntHaveEnouPrivilegesToAccessThisResource(Error)
  case youHaveExceededYouAPIKEYRateLImits(Error)
  case youRequestedSpecificSingleItemWeDontHaveAtThis(Error)
}

///Associated Values
public enum ApiError: Error {
    case failure (Error, Int)
    case invalidResponse(Int)
    case badRequest(Int)
    case unauthorized(Int)
    case forbidden(Int)
    case tooManyRequests(Int)
    case NoData(Int)
    case emptyResponse
    case unknownError(Int)
}
