//
//  LandingContracts.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

enum LandingViewModelOutput {
    case movies(_ movies: [MovieDetail])
    case showAlert(_ messsage: String)
}

enum LandingViewRoute {
    case detail(_ id: Int)
}

protocol LandingViewModelDelegate: AnyObject {
    func viewModelOutput(_ output: LandingViewModelOutput)
    func navigate(to route: LandingViewRoute)
}

protocol LandingViewModelProtocol: AnyObject {
    var delegate: LandingViewModelDelegate? { get set }
    
    func getTrendingItems(_ media: MediaType, _ time: TimeWindow)
    func go(to viewController: LandingViewRoute)
}
