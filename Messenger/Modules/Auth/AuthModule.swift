//
//  AuthModule.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import Foundation

struct AuthModuleDependencies {
    let apiManager: APIManagerable
}

struct AuthModule {
    private let diContainer: AuthDIContainer

    init(dependencies: AuthModuleDependencies) {
        self.diContainer = AuthDIContainer(dependencies: dependencies)
    }

    func makeAuthFlowCoordinator(
        router: Router
    ) -> CoordinatorOutput {
        let coordinator = AuthFlowCoordinator(
            router: router,
            diContainer: diContainer
        )

        return coordinator
    }
}
