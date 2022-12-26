//
//  AuthInteractorInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol AuthInteractorInput: AnyObject {
    func sendAuthCode(request: SendAuthCodeRequest)
}
