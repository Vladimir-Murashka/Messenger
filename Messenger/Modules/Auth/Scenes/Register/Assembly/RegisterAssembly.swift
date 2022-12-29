//
//  RegisterAssembly.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

import UIKit

struct RegisterDependencies {
    let router: RegisterRouterInput
    let apiManager: APIManagerable
}

struct RegisterAssembly {
    private let dependencies: RegisterDependencies

    init(dependencies: RegisterDependencies) {
        self.dependencies = dependencies
    }

    func build(phone: String, phoneForTextFeild: String) -> UIViewController {
        let viewController = RegisterViewController()

        let presenter = RegisterPresenter(phone: phone, phoneForTextFeild: phoneForTextFeild)
        presenter.view = viewController
        presenter.router = dependencies.router

        let interactor = RegisterInteractor(apiManager: dependencies.apiManager)
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter

        return viewController
    }
}
