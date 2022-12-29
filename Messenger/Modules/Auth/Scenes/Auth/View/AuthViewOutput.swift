//
//  AuthViewOutput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol AuthViewOutput: AnyObject {
    func sendButtonPressed(phone: String, phoneForTextFeild: String)
}
