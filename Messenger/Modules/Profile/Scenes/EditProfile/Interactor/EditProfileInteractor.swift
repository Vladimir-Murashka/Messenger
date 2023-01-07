//
//  EditProfileInteractor.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

final class EditProfileInteractor {
    weak var output: EditProfileInteractorOutput!

    // MARK: - Private proprties

    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }
}

extension EditProfileInteractor: EditProfileInteractorInput {
    func putUserInfo() {}
}
