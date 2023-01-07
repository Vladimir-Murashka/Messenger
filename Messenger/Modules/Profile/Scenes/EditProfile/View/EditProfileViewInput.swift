//
//  EditProfileViewInput.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

protocol EditProfileViewInput: AnyObject {
    func showError()
    func startLoading()
    func stopLoading()
}
