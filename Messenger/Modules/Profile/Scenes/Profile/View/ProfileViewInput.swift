//
//  ProfileViewInput.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

protocol ProfileViewInput: AnyObject {
    func showError()
    func startLoading()
    func stopLoading()
}
