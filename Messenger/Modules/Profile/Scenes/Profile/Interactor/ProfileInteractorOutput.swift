//
//  ProfileInteractorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

protocol ProfileInteractorOutput: AnyObject {
    func didGetUserSuccessfully(response: SendAuthCodeResponse)
    func didGetUserFailure(error: Error)
}
