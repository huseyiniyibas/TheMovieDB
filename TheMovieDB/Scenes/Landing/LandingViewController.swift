//
//  LandingViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class LandingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

extension LandingViewController: LandingViewModelDelegate {
    func viewModelOutput(_ output: LandingViewModelOutput) {
        switch output {
        case .showAlert(let message):
            print("Alert: ", message)
        }
    }
    
    func navigate(to route: LandingViewRoute) {
        switch route {
        case .detail:
            show(MovieDetailBuilder.make(), sender: nil)
        }
    }
    
    
}
