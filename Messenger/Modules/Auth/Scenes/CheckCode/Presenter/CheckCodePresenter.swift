//
//  CheckCodePresenter.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class CheckCodePresenter {
    weak var view: CheckCodeViewInput!
    var interactor: CheckCodeInteractorInput!
    weak var router: CheckCodeRouterInput!
    
    private let phone: String
    private let phoneForTextFeild: String

    init(
        phone: String,
        phoneForTextFeild: String
    ) {
        self.phone = phone
        self.phoneForTextFeild = phoneForTextFeild
    }
}

extension CheckCodePresenter: CheckCodeViewOutput {
    func didUserFinishEnter(code: String) {
        view.startLoading()
        let request = CheckAuthCodeRequest(phone: phone, code: code)
        interactor.checkAuthCode(request: request)
    }
}

extension CheckCodePresenter: CheckCodeInteractorOutput {
    func didCheckAuthCodeSuccessfully(response: CheckAuthCodeResponse) {
        view.stopLoading()
        response.isUserExists
        ? router.finishFlow()
        : router.routeToRegister(phone: phone, phoneForTextFeild: phoneForTextFeild)
    }
    
    func didCheckAuthCodeFailure(error: Error) {
        view.stopLoading()
        view.showError()
    }
}

