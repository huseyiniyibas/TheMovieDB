//
//  BaseNavigationController.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import UIKit

class BaseNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    func setup() {
        self.setNavigationBarHidden(false, animated: true)
        // TODO: - Set appearance attributes
    }
}
