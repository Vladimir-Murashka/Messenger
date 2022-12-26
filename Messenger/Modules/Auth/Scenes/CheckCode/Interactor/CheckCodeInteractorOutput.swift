//
//  CheckCodeInteractorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CheckCodeInteractorOutput: AnyObject {
    func didCheckAuthCodeSuccessfully(response: CheckAuthCodeResponse)
    func didCheckAuthCodeFailure(error: Error)
}
