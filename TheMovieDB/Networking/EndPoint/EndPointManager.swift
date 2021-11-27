//
//  EndPointManager.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import Foundation

let environment: NetworkEnvironment = .dev

enum EndPointManager {
    case movieDetails(_ id: Int)
        
}

extension EndPointManager: EndPointType {
    var baseURL: URL {
        switch environment {
        case .dev:
            guard let url = URL(string: Constants.DEVELOPMENT_BASE_URL) else { fatalError("baseURL could not configured!") }
            return url
        case .qa:
            guard let url = URL(string: Constants.QA_BASE_URL) else { fatalError("baseURL could not configured!") }
            return url
        case .live:
            guard let url = URL(string: Constants.LIVE_BASE_URL) else { fatalError("baseURL could not configured!") }
            return url
        }
    }

    var path: String {
        switch self {
        case .movieDetails(let id):
            return "movie/\(id)?api_key=\(Constants.API_KEY)"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var task: HTTPTask {
        switch self {
        default:
            return .requestParameters(bodyParameters: [:], bodyEncoding: .jsonEncoding, urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        default:
            let header = HTTPHeaders()

            return header
        }
    }

    var contentType: ContentType {
        switch self {
        default:
            return .json
        }
    }
}
