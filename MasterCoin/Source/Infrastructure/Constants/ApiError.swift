//
//  ApiError.swift
//  MasterCoin
//
//  Created by Nikolas Gianoglou Coelho on 11/03/22.
//

import Foundation

public enum ApiErrorCode: Int {
    case serverErrorStatusCode = 500
}

public enum KnownApiFailures: Error {
    case serverErrorStatusCode(Error)
}

///Associated Values
public enum ApiError: Error {
    case failure (Error, Int)
    case invalidResponse(Int)
    case emptyResponse
    case unknownError(Int)
}
