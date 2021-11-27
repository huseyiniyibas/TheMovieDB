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
    
    func go(to viewController: LandingViewRoute) {
//        self.delegate?.navigate(to: ) // TODO: - Navigate to Detail page
    }
}
