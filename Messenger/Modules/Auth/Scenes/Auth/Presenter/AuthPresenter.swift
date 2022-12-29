//
//  AuthPresenter.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class AuthPresenter {
    weak var view: AuthViewInput!
    var interactor: AuthInteractorInput!
    weak var router: AuthRouterInput!
    
    private var phone: String = ""
    private var phoneForTextFeild: String = ""

    init() {}
}

extension AuthPresenter: AuthViewOutput {
    func sendButtonPressed(phone: String, phoneForTextFeild: String) {
        self.phone = phone
        self.phoneForTextFeild = phoneForTextFeild
        view.startLoading()
        let request = SendAuthCodeRequest(phone: phone)
        interactor.sendAuthCode(request: request)
    }
}

extension AuthPresenter: AuthInteractorOutput {
    func didSendAuthCodeSuccessfully(response: SendAuthCodeResponse) {
        view.stopLoading()
        response.isSuccess
        ? router.routeToCheckAuthCode(phone: phone, phoneForTextFeild: phoneForTextFeild)
        : view.showError()
    }
    
    func didSendAuthCodeFailure(error: Error) {
        view.stopLoading()
        view.showError()
    }
}
