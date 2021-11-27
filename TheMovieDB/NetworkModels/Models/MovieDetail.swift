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
        id = try values.decode(Int.self, forKey: .id)
        voteAverage = try values.decode(Double.self, forKey: .voteAverage)
        originalTitle = try values.decode(String.self, forKey: .originalTitle)
        overview = try values.decode(String.self, forKey: .overview)
        posterPath = try values.decode(String.self, forKey: .posterPath)
        backdropPath = try values.decode(String.self, forKey: .backdropPath)
        releaseDate = try values.decode(String.self, forKey: .releaseDate)
    }

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case voteAverage = "vote_average"
        case originalTitle = "original_title"
        case overview = "overview"
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
}
