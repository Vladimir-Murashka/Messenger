//
//  ProfileViewController.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

import UIKit

final class ProfileViewController: UIViewController {
    var output: ProfileViewOutput!

    private lazy var profileView: ProfileView = {
        let view = ProfileView()
        view.output = output
        return view
    }()

    override func loadView() {
        view = profileView
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

extension ProfileViewController: ProfileViewInput {
    func startLoading() {}

    func stopLoading() {}

    func showError() {}

}
