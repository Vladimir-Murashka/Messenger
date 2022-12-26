//
//  RegisterInteractorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

protocol RegisterInteractorOutput: AnyObject {
    func didRegisterSuccessfully(response: RegisterResponse)
    func didRegisterFailure(error: Error)
}

