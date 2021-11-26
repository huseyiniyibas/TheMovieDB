//
//  EndPointType.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import Foundation

protocol EndPointType {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
    var contentType: ContentType { get }
}
