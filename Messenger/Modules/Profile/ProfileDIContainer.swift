//
//  ProfileDIContainer.swift
//  Messenger
//
//  Created by Swift Learning on 29.12.2022.
//

import UIKit

final class ProfileDIContainer {
    private let dependencies: ProfileModuleDependencies

    init(dependencies: ProfileModuleDependencies) {
        self.dependencies = dependencies
    }

    func makeProfileViewController(router: AuthRouterInput) -> UIViewController {
        return UIViewController()
    }
    
    func makeEditProfileViewController(router: AuthRouterInput) -> UIViewController {
        return UIViewController()
    }
}

