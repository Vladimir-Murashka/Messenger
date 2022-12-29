//
//  CheckCodeAssembly.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

struct CheckCodeDependencies {
    let router: CheckCodeRouterInput
    let apiManager: APIManagerable
}

struct CheckCodeAssembly {
    private let dependencies: CheckCodeDependencies

    init(dependencies: CheckCodeDependencies) {
        self.dependencies = dependencies
    }

    func build(phone: String, phoneForTextFeild: String) -> UIViewController {
        let viewController = CheckCodeViewController()

        let presenter = CheckCodePresenter(phone: phone, phoneForTextFeild: phoneForTextFeild)
        presenter.view = viewController
        presenter.router = dependencies.router

        let interactor = CheckCodeInteractor(apiManager: dependencies.apiManager)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
