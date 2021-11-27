//
//  MovieDetailBuilder.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

final class MovieDetailBuilder: BaseBuilder {
    static func make() -> MovieDetailViewController {
        let controller: MovieDetailViewController = self.load(appStoryboard: .movieDetail, viewController: "MovieDetail")

        return controller
    }
}
