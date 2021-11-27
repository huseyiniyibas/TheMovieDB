//
//  MovieDetailContracts.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

enum MovieDetailViewModelOutput {
    case showAlert(_ messsage: String)
}

enum MovieDetailViewRoute {
    case back
}

protocol MovieDetailViewModelDelegate: AnyObject {
    func viewModelOutput(_ output: MovieDetailViewModelOutput)
    func navigate(to route: MovieDetailViewRoute)
}

protocol MovieDetailViewModelProtocol: AnyObject {
    var delegate: MovieDetailViewModelDelegate? { get set }
    
    func go(to viewController: MovieDetailViewRoute)
}
