//
//  ProfilePresenter.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

import Foundation

final class ProfilePresenter {
    weak var view: ProfileViewInput!
    var interactor: ProfileInteractorInput!
    weak var router: ProfileRouterInput!
    
    private var phone: String = ""
    private var phoneForTextFeild: String = ""
    private var dateBirthday = "1991.02.13"
    
    init() {}
}

extension ProfilePresenter: ProfileViewOutput {
    func viewDidLoad() {
        let date = dateBirthday.toDate(.isoDate) ?? Date()
        let zodiacSingImageName = getZodiacSign(date)
        view.updateZodiacSingImage(name: zodiacSingImageName)
    }
    
    func editProfileButtonPressed() {
        router.routeToEditProfile()
    }
}

extension ProfilePresenter: ProfileInteractorOutput {
    
    func didGetUserSuccessfully(response: SendAuthCodeResponse) {}
    
    func didGetUserFailure(error: Error) {}
}

extension ProfilePresenter: ZodiacSingProtocol {}
