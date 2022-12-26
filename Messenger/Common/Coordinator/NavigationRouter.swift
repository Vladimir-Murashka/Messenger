//
//  NavigationRouter.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class NavigationRouter: NSObject {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

extension NavigationRouter: Router {
    func push(_ viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }

    func setRoot(
        _ viewController: UIViewController,
        animated: Bool
    ) {
        navigationController.setViewControllers([viewController], animated: animated)
    }
}
