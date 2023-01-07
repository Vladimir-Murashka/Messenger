//
//  EditProfileViewController.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

import UIKit

final class EditProfileViewController: UIViewController {
    var output: EditProfileViewOutput!

    private lazy var editProfileView: EditProfileView = {
        let view = EditProfileView()
        view.output = output
        return view
    }()

    override func loadView() {
        view = editProfileView
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

extension EditProfileViewController: EditProfileViewInput {
    func startLoading() {}

    func stopLoading() {}

    func showError() {}

}

