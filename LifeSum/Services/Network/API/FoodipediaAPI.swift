//
//  FoodipediaAPI.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Moya

enum FoodipediaAPI: DecodableTargetTypeWithAPIVersion {
    
    case codetest(id: Int)
    
    typealias ResultType = Foodipedia
    
    var baseURL: URL {
        return URL(string: "\(Environment.api.url)/\(apiVersion)")!
    }
    
    var path: String {
        switch self {
        case .codetest:
            return "foodipedia/codetest"
        }
    }
    var apiVersion: String {
        return APIConfiguration.Version.two.rawValue
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .codetest(let id):
            let parameters: [String: Any] = [ "foodid": id ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        
        return nil
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
