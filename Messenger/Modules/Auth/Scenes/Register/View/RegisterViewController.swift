//
//  RegisterViewController.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

import UIKit

final class RegisterViewController: UIViewController {
    var output: RegisterViewOutput!

    private lazy var registerView: RegisterView = {
        let view =  RegisterView()
        view.output = output
        return view
    }()

    override func loadView() {
        view = registerView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RegisterViewController: RegisterViewInput {
    func startLoading() {}

    func stopLoading() {}

    func showError() {}
}
