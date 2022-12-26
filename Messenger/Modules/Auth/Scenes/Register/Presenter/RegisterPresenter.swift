//
//  RegisterPresenter.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

final class RegisterPresenter {
    weak var view: RegisterViewInput!
    var interactor: RegisterInteractorInput!
    weak var router: RegisterRouterInput!
    
    private let phone: String

    init(phone: String) {
        self.phone = phone
    }
}

extension RegisterPresenter: RegisterViewOutput {
    func registerButtonPressed(name: String, userName: String) {
        view.startLoading()
        let request = RegisterRequest(phone: phone, name: name, username: userName)
        interactor.register(request: request)
    }
}

extension RegisterPresenter: RegisterInteractorOutput {
    func didRegisterSuccessfully(response: RegisterResponse) {
        
    }
    
    func didRegisterFailure(error: Error) {
        view.stopLoading()
        view.showError()
    }
}
