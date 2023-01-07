//
//  ProfilePresenter.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

final class ProfilePresenter {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    weak var router: ProfileRouterInput!
    
    private var phone: String = ""
    private var phoneForTextFeild: String = ""

    init() {}
}

extension ProfilePresenter: ProfileViewOutput {
    func editProfileButtonPressed() {
        router.routeToEditProfile()
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    
    func didGetUserSuccessfully(response: SendAuthCodeResponse) {}
    
    func didGetUserFailure(error: Error) {}
}

