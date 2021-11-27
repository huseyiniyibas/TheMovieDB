//
//  MovieDetailViewModel.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    private let service: NetworkProvider
    weak var delegate: MovieDetailViewModelDelegate?
    
    init(service: NetworkProvider) {
        self.service = service
    }
    
    func go(to viewController: MovieDetailViewRoute) {
        self.delegate?.navigate(to: .back)
    }
}
