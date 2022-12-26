//
//  AuthAssembly.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

struct AuthDependencies {
    let router: AuthRouterInput
    let apiManager: APIManagerable
}

struct AuthAssembly {
    private let dependencies: AuthDependencies

    init(dependencies: AuthDependencies) {
        self.dependencies = dependencies
    }

    func build() -> UIViewController {
        let viewController = AuthViewController()

        let presenter = AuthPresenter()
        presenter.view = viewController
        presenter.router = dependencies.router

        let interactor = AuthInteractor(apiManager: dependencies.apiManager)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
