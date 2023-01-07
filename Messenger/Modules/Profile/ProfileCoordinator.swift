//
//  ProfileCoordinator.swift
//  Messenger
//
//  Created by Swift Learning on 29.12.2022.
//

final class ProfileFlowCoordinator: BaseCoordinator & CoordinatorOutput {
    var onFinish: (() -> Void)?

    // MARK: - Private Properties

    private let router: Router
    private let diContainer: ProfileDIContainer

    // MARK: - Initialization

    init(
        router: Router,
        diContainer: ProfileDIContainer
    ) {
        self.router = router
        self.diContainer = diContainer
    }

    override func start() {
        let profileViewController = diContainer.makeProfileViewController(router: self)

        router.setRoot(profileViewController, animated: true)
    }
}

extension ProfileFlowCoordinator: ProfileRouterInput {
    func routeToEditProfile() {
        let editProfileViewController = diContainer.makeEditProfileViewController(router: self)
        
        router.push(editProfileViewController)
    }
}

extension ProfileFlowCoordinator: EditProfileRouterInput {}

