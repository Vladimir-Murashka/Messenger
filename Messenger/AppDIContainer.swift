//
//  AppDIContainer.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class AppDIContainer {
    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }

    convenience init() {
        let keychainManager = KeychainManager()
        let decoderManager = DecoderManager()
        let networkManager = NetworkManager(tokensStorage: keychainManager)
        let apiManager = APIManager(networkManager: networkManager, decoderManager: decoderManager)

        self.init(apiManager: apiManager)
    }
}

extension AppDIContainer {
    func makeAuthFlowCoordinator(router: Router) -> CoordinatorOutput {
        let dependencies = AuthModuleDependencies(apiManager: apiManager)

        return AuthModule(dependencies: dependencies).makeAuthFlowCoordinator(router: router)
    }
}
