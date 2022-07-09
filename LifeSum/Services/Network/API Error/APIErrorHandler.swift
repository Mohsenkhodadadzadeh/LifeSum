//
//  APIErrorHandler.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Moya

class APIErrorHandler {
    
    static func handle(_ error: MoyaError, target: TargetType? = nil, ignoreNoInternetErrors: Bool = false, request: (() -> Cancellable)? = nil) {
        let apiError = error.apiErrorDetail
        let code = apiError.code
        let type = apiError.type
        let message = apiError.message
        let title = "error_\(code ?? -1)"
       
        print(">>>> \(title) - \(type ?? "empty type") - \(message ?? "Empty message")")
        
    }
}
