//
//  MultiMoyaProvider.swift
//  LifeSum
//
//  Created by Mohsen on 7/9/22.
//

import Moya

protocol DecodableTargetType: Moya.TargetType {
    associatedtype ResultType: Codable
}

protocol DecodableTargetTypeWithAPIVersion: DecodableTargetType {
    var apiVersion: String { get }
}

final class MultiMoyaProvider: MoyaProvider<MultiTarget> {
    
    typealias Target = MultiTarget
    
    override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping, requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping, stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub, callbackQueue: DispatchQueue? = nil, session: Session = MoyaProvider<Target>.defaultAlamofireSession(), plugins: [PluginType] = [], trackInflights: Bool = false) {
        
        super.init(endpointClosure: endpointClosure, requestClosure: requestClosure, stubClosure: stubClosure, callbackQueue: callbackQueue, session: session, plugins: plugins, trackInflights: trackInflights)
    }
    
    @discardableResult
    func requestDecoded<T: DecodableTargetType>(_ target: T, handlesErrorLocally: Bool = false, needsFullscreenLoader: Bool = true, completion: @escaping (_ result: Result<T.ResultType, MoyaError>) -> Void) -> Cancellable {
        if needsFullscreenLoader {
            FullscreenLoader.show()
        }
        return request(MultiTarget(target)) { result in
                FullscreenLoader.hide()
            
            switch result {
            case .success(let response):
                do {
                    let jsonDecoder = JSONDecoder()
                    let parsedData = try jsonDecoder.decode(BaseEntity<T.ResultType>.self, from: response.data)
                    guard let resultObject = parsedData.response else {
                        completion(.failure(.jsonMapping(response)))
                        return
                    }
                    completion(.success(resultObject))
                } catch {
                    completion(.failure(.jsonMapping(response)))
                }
            case .failure(let error):
                completion(.failure(error))
                if handlesErrorLocally {
                    return
                }
                APIErrorHandler.handle(error, target: target) { () -> Cancellable in
                    return self.requestDecoded(target, handlesErrorLocally: handlesErrorLocally, completion: completion)
                }
            }
        }
    }
}
