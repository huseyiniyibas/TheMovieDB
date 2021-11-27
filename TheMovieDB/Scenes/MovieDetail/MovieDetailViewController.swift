//
//  MovieDetailViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class MovieDetailViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func viewModelOutput(_ output: MovieDetailViewModelOutput) {
        switch output {
        case .showAlert(let message):
            print("Alert: ", message)
        }
    }
    
    func navigate(to route: MovieDetailViewRoute) {
        switch route {
        case .back:
            navigationController?.popViewController(animated: true)
        }
    }
}
