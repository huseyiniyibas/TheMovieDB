//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }
    var id: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let id = id else { return }
        viewModel?.getMovieDetails(id)
    }

}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func viewModelOutput(_ output: MovieDetailViewModelOutput) {
        DispatchQueue.main.async {
            switch output {
            case .movie(let movie):
                self.title = movie.originalTitle
                self.overviewLabel.text = movie.overview
                guard let posterPath = movie.posterPath, let url = URL(string: Constants.IMAGE_BASE_URL + posterPath) else { return }
                self.posterImageView.downloaded(from: url)
                
            case .showAlert(let message):
                print("Alert: ", message)
            }
        }
    }
    
    func navigate(to route: MovieDetailViewRoute) {
        switch route {
        case .back:
            navigationController?.popViewController(animated: true)
        }
    }
}
