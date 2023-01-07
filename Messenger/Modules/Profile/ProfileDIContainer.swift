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

    func makeProfileViewController(router: ProfileRouterInput) -> UIViewController {
        let dependencies = ProfileDependencies(
            router: router,
            apiManager: dependencies.apiManager
        )
        let assembly = ProfileAssembly(dependencies: dependencies)

        return assembly.build()
    }
    
    func makeEditProfileViewController(router: EditProfileRouterInput) -> UIViewController {
        let dependencies = EditProfileDependencies(
            router: router,
            apiManager: dependencies.apiManager
        )
        let assembly = EditProfileAssembly(dependencies: dependencies)

        return assembly.build()
    }
}

