//
//  AuthViewInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol AuthViewInput: AnyObject {
    func showError()
    func startLoading()
    func stopLoading()
}

