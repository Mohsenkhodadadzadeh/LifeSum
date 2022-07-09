//
//  MoyaError+APIError.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Moya
import SwiftyJSON

extension MoyaError {
    
    var apiErrorDetail: (code: Int?, type: String?, message: String?) {
        let error = APIErrors
        let code = error.code
        let type = error.errorType
        let message = error.errorDetail
        return (code, type, message)
    }
    
    var APIErrors: Meta {
        guard let response = response else {
           return Meta(code: -1, errorType: "SYSTEM_ERROR", errorDetail: "NO_RESPONSE")
        }
        
        let responseJSON = JSON(response.data)
        
        let code = responseJSON["meta"]["code"].intValue
        let errorType = responseJSON["meta"]["errorType"].stringValue
        let errorDetail = responseJSON["meta"]["errorDetail"].stringValue
        
        return Meta(code: code, errorType: errorType, errorDetail: errorDetail)
       
    }
}
