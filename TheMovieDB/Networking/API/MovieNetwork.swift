//
//  MovieNetwork.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

protocol MovieNetworkProtocols {
    func getMovieDetails(_ id: Int, completion: @escaping (_ result: MovieDetail?, _ error: String?, _ responseCode: Int) -> Void)
    func getTrendingItems(_ media: MediaType, time: TimeWindow, completion: @escaping (_ result: TrendingResponse?, _ error: String?, _ responseCode: Int) -> Void)
}

final class MovieNetwork: MovieNetworkProtocols {
    private let network: Network
    
    init(network: Network) {
        self.network = network
    }
    
    func getMovieDetails(_ id: Int, completion: @escaping (MovieDetail?, String?, Int) -> Void) {
        self.network.genericFetch(EndPointManager.movieDetails(id)) { (data: MovieDetail?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
    
    func getTrendingItems(_ media: MediaType, time: TimeWindow, completion: @escaping (TrendingResponse?, String?, Int) -> Void) {
        self.network.genericFetch(EndPointManager.trendingItems(media: media, time: time)) { (data: TrendingResponse?, error, responseCode) in
            completion(data, error, responseCode)
        }
    }
}
