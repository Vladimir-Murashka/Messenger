//
//  AuthView.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class AuthView: UIView {
    var output: AuthViewOutput!

    // MARK: - Private properties

    private let phoneTextField = UITextField()

    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    @objc
    private func didTapSendButton() {
        let phone = phoneTextField.text ?? ""
        output.sendButtonPressed(phone: phone)
    }
}
