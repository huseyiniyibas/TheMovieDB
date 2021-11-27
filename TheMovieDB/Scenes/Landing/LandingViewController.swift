//
//  LandingViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class LandingViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

// MARK: - UITableView

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


// MARK: - Network

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
