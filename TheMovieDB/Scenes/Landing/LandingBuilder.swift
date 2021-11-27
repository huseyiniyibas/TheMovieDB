//
//  LandingBuilder.swift
//  TheMovieDB
//
//  Created by Hüseyin İyibaş on 27.11.2021.
//

import Foundation

final class LandingBuilder: BaseBuilder {
    static func make() -> LandingViewController {
        let controller: LandingViewController = self.load(appStoryboard: .landing, viewController: "Landing")
        controller.viewModel = LandingViewModel(service: NetworkProvider())

        return controller
    }
}
