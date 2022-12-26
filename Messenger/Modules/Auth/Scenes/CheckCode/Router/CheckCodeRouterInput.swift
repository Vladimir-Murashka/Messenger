//
//  CheckCodeRouterInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CheckCodeRouterInput: AnyObject {
    func routeToRegister()
    func finishFlow()
}
