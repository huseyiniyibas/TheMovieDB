//
//  MovieDetailBuilder.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

final class MovieDetailBuilder: BaseBuilder {
    static func make(_ id: Int) -> MovieDetailViewController {
        let controller: MovieDetailViewController = self.load(appStoryboard: .movieDetail, viewController: "MovieDetail")
        controller.viewModel = MovieDetailViewModel(service: NetworkProvider())
        controller.id = id
        
        return controller
    }
}
