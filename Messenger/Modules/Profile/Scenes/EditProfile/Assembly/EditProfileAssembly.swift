//
//  EditProfileAssembly.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

import UIKit

struct EditProfileDependencies {
    let router: EditProfileRouterInput
    let apiManager: APIManagerable
}

struct EditProfileAssembly {
    private let dependencies: EditProfileDependencies

    init(dependencies: EditProfileDependencies) {
        self.dependencies = dependencies
    }

    func build() -> UIViewController {
        let viewController = EditProfileViewController()

        let presenter = EditProfilePresenter()
        presenter.view = viewController
        presenter.router = dependencies.router

        let interactor = EditProfileInteractor(apiManager: dependencies.apiManager)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
