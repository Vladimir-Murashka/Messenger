//
//  AuthInteractorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol AuthInteractorOutput: AnyObject {
    func didSendAuthCodeSuccessfully(response: SendAuthCodeResponse)
    func didSendAuthCodeFailure(error: Error)
}

