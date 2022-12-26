//
//  AppCoordinator.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private var router: Router?
    private let window: UIWindow
    private let diContainer: AppDIContainer

    init(
        window: UIWindow,
        navigationController: UINavigationController = UINavigationController(),
        diContainer: AppDIContainer = AppDIContainer()
    ) {
        self.router = NavigationRouter(navigationController: navigationController)
        self.window = window
        self.window.rootViewController = navigationController
        self.diContainer = diContainer
        super.init()
    }

    override func start() {
        window.makeKeyAndVisible()
        startAuthFlowCoordinator()
    }

    private func startAuthFlowCoordinator() {
        let navigationController = UINavigationController()
        let newRouter = NavigationRouter(navigationController: navigationController)
        self.router = newRouter

        let authCoordinator = diContainer.makeAuthFlowCoordinator(router: newRouter)
        authCoordinator.onFinish = { [weak self] in
            self?.startMainFlowCoordinator()
        }
        addChild(authCoordinator)

        authCoordinator.start()

        window.rootViewController = navigationController

        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionCrossDissolve,
            animations: {},
            completion: nil
        )
    }

    private func startMainFlowCoordinator() {}
}

