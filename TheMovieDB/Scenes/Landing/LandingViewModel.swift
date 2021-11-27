//
//  LandingViewModel.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

final class LandingViewModel: LandingViewModelProtocol {
    private let service: NetworkProvider
    weak var delegate: LandingViewModelDelegate?
    
    init(service: NetworkProvider) {
        self.service = service
    }
    
    func getTrendingItems(_ media: MediaType, _ time: TimeWindow) {
        self.service.makeMovieNetwork().getTrendingItems(media, time: time) { (response, error, responseCode) in
            if let error = error {
                self.delegate?.viewModelOutput(.showAlert(error))
            }
            
            switch responseCode {
            case 200:
                if let response = response, let movies = response.results {
                    self.delegate?.viewModelOutput(.movies(movies))
                }
            default:
                break
            }
        }
    }
    
    func go(to viewController: LandingViewRoute) {
//        self.delegate?.navigate(to: ) // TODO: - Navigate to Detail page
    }
}
