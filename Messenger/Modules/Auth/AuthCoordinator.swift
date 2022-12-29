//
//  AuthCoordinator.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class AuthFlowCoordinator: BaseCoordinator & CoordinatorOutput {
    var onFinish: (() -> Void)?

    // MARK: - Private Properties

    private let router: Router
    private let diContainer: AuthDIContainer

    // MARK: - Initialization

    init(
        router: Router,
        diContainer: AuthDIContainer
    ) {
        self.router = router
        self.diContainer = diContainer
    }

    override func start() {
        let authViewController = diContainer.makeAuthViewController(router: self)

        router.setRoot(authViewController, animated: true)
    }
}

extension AuthFlowCoordinator: AuthRouterInput {
    func routeToCheckAuthCode(phone: String, phoneForTextFeild: String) {
        let checkCodeViewController = diContainer.makeCheckCodeViewController(router: self, phone: phone, phoneForTextFeild: phoneForTextFeild)
        router.push(checkCodeViewController)
    }
}

extension AuthFlowCoordinator: CheckCodeRouterInput {
    func routeToRegister(phone: String, phoneForTextFeild: String) {
        let registerViewController = diContainer.makeRegisterViewController(router: self, phone: phone, phoneForTextFeild: phoneForTextFeild)
        router.push(registerViewController)
    }
    func finishFlow() {
        onFinish?()
    }
}

extension AuthFlowCoordinator: RegisterRouterInput {
    
}
