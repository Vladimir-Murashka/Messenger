//
//  RegisterViewOutput.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

protocol RegisterViewOutput: AnyObject {
    func registerButtonPressed(name: String, userName: String)
    func viewDidLoad()
}
