//
//  ProfileAssembly.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

import UIKit

struct ProfileDependencies {
    let router: ProfileRouterInput
    let apiManager: APIManagerable
}

struct ProfileAssembly {
    private let dependencies: ProfileDependencies

    init(dependencies: ProfileDependencies) {
        self.dependencies = dependencies
    }

    func build() -> UIViewController {
        let viewController = ProfileViewController()

        let presenter = ProfilePresenter()
        presenter.view = viewController
        presenter.router = dependencies.router

        let interactor = ProfileInteractor(apiManager: dependencies.apiManager)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
