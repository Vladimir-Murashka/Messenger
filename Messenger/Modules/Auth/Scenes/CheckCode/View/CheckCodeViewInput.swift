//
//  CheckCodeViewInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CheckCodeViewInput: AnyObject {
    func showError()
    func startLoading()
    func stopLoading()
}
