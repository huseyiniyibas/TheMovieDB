//
//  LandingContracts.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

enum LandingViewModelOutput {
    case showAlert(_ messsage: String)
}

enum LandingViewRoute {
    case detail
}

protocol LandingViewModelDelegate: AnyObject {
    func viewModelOutput(_ output: LandingViewModelOutput)
    func navigate(to route: LandingViewRoute)
}

protocol LandingViewModelProtocol: AnyObject {
    var delegate: LandingViewModelDelegate? { get set }
    
    func go(to viewController: LandingViewRoute)
}
