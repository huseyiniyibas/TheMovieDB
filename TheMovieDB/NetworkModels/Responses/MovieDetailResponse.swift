//
//  MovieDetailResponse.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

public struct MovieDetailResponse: Decodable {
    var id: Int?
    var voteAverage: Int?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
}
