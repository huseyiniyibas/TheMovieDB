//
//  MovieNetwork.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

protocol MovieNetworkProtocols {
    func getMovieDetails(_ id: Int, completion: @escaping (_ result: MovieDetailResponse?, _ error: String?, _ responseCode: Int) -> Void)
}

final class MovieNetwork: MovieNetworkProtocols {
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getMovieDetails(_ id: Int, completion: @escaping (MovieDetailResponse?, String?, Int) -> Void) {
        self.network.genericFetch(EndPointManager.movieDetails(id)) { (data: MovieDetailResponse?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
}
