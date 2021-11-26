//
//  JSONParameterEncoder.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import Foundation

public struct JSONParameterEncoder: ParameterEncoder {

    public func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

            urlRequest.httpBody = jsonAsData

            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }

    public func encode(urlRequest: inout URLRequest, with parameters: ParametersArray) throws {
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

            urlRequest.httpBody = jsonAsData

            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }

    public func encode(urlRequest: inout URLRequest, with parameters: Parameter) throws {

    }
}
