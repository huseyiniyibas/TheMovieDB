//
//  TrendingResponses.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

public struct TrendingResponse: Decodable {
    var results: [MovieDetail]?
}
