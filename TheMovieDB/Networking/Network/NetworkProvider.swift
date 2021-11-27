//
//  NetworkProvider.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 26.11.2021.
//

import Foundation

class NetworkProvider {
    public func makeMovieNetwork() -> MovieNetwork {
        let network = Network()
        
        return MovieNetwork(network: network)
    }
}
