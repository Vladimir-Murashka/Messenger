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

    init(phone: String) {
        self.phone = phone
    }
}

extension CheckCodePresenter: CheckCodeViewOutput {
    func sendButtonPressed(code: String) {
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
        : router.routeToRegister()
    }
    
    func didCheckAuthCodeFailure(error: Error) {
        view.stopLoading()
        view.showError()
    }
}

