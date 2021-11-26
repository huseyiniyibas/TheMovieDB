//
//  HTTPTask.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)

    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)

    case requestArrayParametersAndHeaders(bodyParameters: ParametersArray?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)

    case requestXMLParameterAndHeaders(bodyParameters: Parameter?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
}
