//
//  ProfileModule.swift
//  Messenger
//
//  Created by Swift Learning on 29.12.2022.
//

import Foundation

struct ProfileModuleDependencies {
    let apiManager: APIManagerable
}

struct ProfileModule {
    private let diContainer: ProfileDIContainer

    init(dependencies: ProfileModuleDependencies) {
        self.diContainer = ProfileDIContainer(dependencies: dependencies)
    }

    func makeAuthFlowCoordinator(
        router: Router
    ) -> CoordinatorOutput {
        let coordinator = ProfileFlowCoordinator(
            router: router,
            diContainer: diContainer
        )

        return coordinator
    }
}
