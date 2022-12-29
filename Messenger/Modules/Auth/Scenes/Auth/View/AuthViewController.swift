//
//  AuthViewController.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class AuthViewController: UIViewController {
    var output: AuthViewOutput!

    private lazy var authView: AuthView = {
        let view = AuthView()
        view.output = output
        return view
    }()

    override func loadView() {
        view = authView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        self.view.endEditing(true)
    }
}

extension AuthViewController: AuthViewInput {
    func startLoading() {}

    func stopLoading() {}

    func showError() {}

}
