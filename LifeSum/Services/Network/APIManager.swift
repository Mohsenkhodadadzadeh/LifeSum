//
//  APIManager.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Moya
import Alamofire

class APIManager: NSObject {
    var provider: MultiMoyaProvider?
    
    static let shared = APIManager()
    
    override private init() {
        super.init()
        setupProvider()
    }
    
    // MARK: - Provider
    
    func setupProvider() {
        let endpointClosure = { (target: MultiTarget) -> Endpoint in
            let targetURL = URL(target: target)
           
            let url = targetURL.absoluteString
            return Endpoint(url: url, sampleResponseClosure: {.networkResponse(200, target.sampleData)}, method: target.method, task: target.task, httpHeaderFields: target.headers)
        }
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        let session = Alamofire.Session(configuration: configuration)
        provider = MultiMoyaProvider(endpointClosure: endpointClosure, session: session, plugins: [NetworkLoggerPlugin()])
    }
    
    func getFoodDetail(code id: Int, completion: @escaping (_ result: Result<Foodipedia, MoyaError>) -> Void) {
        provider?.requestDecoded(FoodipediaAPI.codetest(id: id)) { (result) in
            completion(result)
        }
    }
}
