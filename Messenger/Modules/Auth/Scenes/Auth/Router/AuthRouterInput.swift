//
//  AuthRouterInput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol AuthRouterInput: AnyObject {
    func routeToCheckAuthCode(phone: String)
}
