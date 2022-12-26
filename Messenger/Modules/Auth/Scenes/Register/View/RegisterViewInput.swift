//
//  RegisterViewInput.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

protocol RegisterViewInput: AnyObject {
    func showError()
    func startLoading()
    func stopLoading()
}
