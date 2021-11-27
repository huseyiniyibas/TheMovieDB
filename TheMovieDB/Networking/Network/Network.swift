//
//  Network.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import UIKit

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String> {
    case unauthorized
    case success
    case failure(String)
}

struct Network {
    func genericFetch<T: Decodable>(_ endpoint: EndPointManager, completion: @escaping (T?, String?, Int) -> Void) {
        let router = RouterProvider().makeRouter()
        
        router.request(endpoint) { data, response, error in
            if error != nil {
                completion(nil, "Please check your network connection.", 0)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .unauthorized:
                    DispatchQueue.main.async {
                        let sceneDelegate = UIApplication.shared.delegate as? SceneDelegate
                        sceneDelegate?.window?.rootViewController = LandingViewController()
                    }
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue, response.statusCode)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(T.self, from: responseData)
                        completion(apiResponse, nil, response.statusCode)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue, response.statusCode)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError, response.statusCode)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 406:
            return .unauthorized
        case 200...204:
            return .success
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 600:
            return .failure(NetworkResponse.outdated.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
