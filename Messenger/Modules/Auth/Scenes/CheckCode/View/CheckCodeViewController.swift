//
//  CheckCodeViewController.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class CheckCodeViewController: UIViewController {
    var output: CheckCodeViewOutput!

    private lazy var checkCodeView: CheckCodeView = {
        let view =  CheckCodeView()
        view.output = output
        return view
    }()

    override func loadView() {
        view = checkCodeView
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

extension CheckCodeViewController: CheckCodeViewInput {
    func startLoading() {}

    func stopLoading() {}

    func showError() {}
}
