//
//  BaseViewController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setControllerTitle(title: String) {
        self.title = title
    }

    func showLoading() {
        // TODO: - Add loading view
    }

    func hideLoading() {
        // TODO: - Hide loading view
    }

}
