//
//  RegisterPresenter.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

import Foundation

final class RegisterPresenter {
    weak var view: RegisterViewInput!
    var interactor: RegisterInteractorInput!
    weak var router: RegisterRouterInput!
    
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

extension RegisterPresenter: RegisterViewOutput {
    func viewDidLoad() {
        view.updateTextField(for: phoneForTextFeild)
    }
    
    func registerButtonPressed(name: String, userName: String) {
        view.startLoading()
        guard validate(userName) else {
            view.showError()
            return
        }
        let request = RegisterRequest(phone: phone, name: name, username: userName)
        interactor.register(request: request)
    }
}

extension RegisterPresenter: RegisterInteractorOutput {
    func didRegisterSuccessfully(response: RegisterResponse) {
        router.finishFlow()
    }
    
    func didRegisterFailure(error: Error) {
        view.stopLoading()
        view.showError()
    }
}

private extension RegisterPresenter {
    func validate(_ userName: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: "^[0-9a-zA-z\\_\\-]{5,20}$", options: .caseInsensitive)
            if regex.matches(in: userName, options: [], range: NSMakeRange(0, userName.count)).count > 0 {
                return true
            }
        } catch {}
        return false
    }
}
