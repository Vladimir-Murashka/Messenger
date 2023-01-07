//
//  EditProfileInteractorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

protocol EditProfileInteractorOutput: AnyObject {
    func didPutUserSuccessfully()
    func didPutUserFailure(error: Error)
}
