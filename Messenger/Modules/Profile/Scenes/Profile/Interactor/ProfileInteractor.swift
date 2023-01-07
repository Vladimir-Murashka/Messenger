//
//  ProfileInteractor.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

final class ProfileInteractor {
    weak var output: ProfileInteractorOutput!

    // MARK: - Private proprties

    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }
}

extension ProfileInteractor: ProfileInteractorInput {
    func fetchUserInfo() {}
}
