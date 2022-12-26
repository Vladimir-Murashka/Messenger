//
//  CheckCodeInteractorInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CheckCodeInteractorInput: AnyObject {
    func checkAuthCode(request: CheckAuthCodeRequest)
}
