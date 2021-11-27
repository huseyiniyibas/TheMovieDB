//
//  MovieDetail.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

public struct MovieDetail: Decodable {
    var id: Int?
    var voteAverage: Double?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        voteAverage = try values.decode(Double.self, forKey: .voteAverage)
        originalTitle = try values.decode(String.self, forKey: .originalTitle)
        posterPath = try values.decode(String.self, forKey: .posterPath)
        backdropPath = try values.decode(String.self, forKey: .backdropPath)
        releaseDate = try values.decode(String.self, forKey: .releaseDate)
    }

    enum CodingKeys: String, CodingKey {
        case voteAverage = "vote_average"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}
