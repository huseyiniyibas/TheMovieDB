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
    
    func getMovieDetails(_ id: Int) {
        self.service.makeMovieNetwork().getMovieDetails(id) { (response, error, responseCode) in
            if let error = error {
                self.delegate?.viewModelOutput(.showAlert(error))
            }
            
            switch responseCode {
            case 200:
                if let movie = response {
                    self.delegate?.viewModelOutput(.movie(movie))
                }
            default:
                break
            }
        }
    }
    
    func go(to viewController: MovieDetailViewRoute) {
        self.delegate?.navigate(to: .back)
    }
}
