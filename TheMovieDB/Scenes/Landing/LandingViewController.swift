//
//  LandingViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class LandingViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: LandingViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    var movies: [MovieDetail]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Trending Movies"
        tableView.register(UINib(nibName: "MovieTableCell", bundle: nil), forCellReuseIdentifier: "MovieTableCell")
        viewModel?.getTrendingItems(.movie, .week)
    }
}

// MARK: - UITableView

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell") as? MovieTableCell {
            guard let movie = movies?[indexPath.row] else { return UITableViewCell() }
            cell.setCell(with: movie)
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let id = movies?[indexPath.row].id else { return }
        viewModel?.go(to: .detail(id))
    }
}

// MARK: - Network

extension LandingViewController: LandingViewModelDelegate {
    func viewModelOutput(_ output: LandingViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .movies(let movies):
                self.movies = movies
                self.tableView.reloadData()
            case .showAlert(let message):
                print("Alert: ", message)
            }
        }
    }
    
    func navigate(to route: LandingViewRoute) {
        DispatchQueue.main.async {
            switch route {
            case .detail(let id):
                self.show(MovieDetailBuilder.make(id), sender: nil)
            }
        }
    }
}
