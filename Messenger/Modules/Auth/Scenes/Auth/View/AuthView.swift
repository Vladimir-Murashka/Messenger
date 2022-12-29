//
//  AuthView.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit
import FlagPhoneNumber

final class AuthView: UIView {
    var output: AuthViewOutput!

    // MARK: - Private properties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()

    private lazy var phoneTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.setFlag(key: .RU)
        textField.delegate = self
        return textField
    }()

    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Roboto", size: 20)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .systemTeal
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemTeal.cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapSendButton), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    @objc
    private func didTapSendButton() {
        sendButton.pushAnimate { [weak self] in
            let phoneForTextFeild = self?.phoneTextField.getRawPhoneNumber() ?? ""
            let phone = self?.phoneTextField.getFormattedPhoneNumber(format: .E164) ?? ""
            self?.output.sendButtonPressed(phone: phone, phoneForTextFeild: phoneForTextFeild)
        }
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubviews(
            logoImageView,
            phoneTextField,
            sendButton
        )
    }
    
    private func setupConstraints() {
        let logoSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        let phoneTextFieldTopOffset: CGFloat = 64
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: logoSize),
            logoImageView.heightAnchor.constraint(equalToConstant: logoSize),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultOffset),
            logoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            phoneTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            phoneTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: phoneTextFieldTopOffset),
            
            sendButton.heightAnchor.constraint(equalToConstant: defaultHeigth),
            sendButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            sendButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            sendButton.bottomAnchor.constraint(equalTo: keyboardLayoutGuide.topAnchor, constant: -defaultOffset)
        ])
    }
}

extension AuthView: FPNTextFieldDelegate {
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {}
    
    func fpnDidValidatePhoneNumber(textField: FlagPhoneNumber.FPNTextField, isValid: Bool) {
        if isValid {
            enabledSendButton()
        } else {
            disabledSendButton()
        }
    }
    
    func fpnDisplayCountryList() {}
}

extension AuthView {
    func enabledSendButton() {
        sendButton.isEnabled = true
    }
    
    func disabledSendButton() {
        sendButton.isEnabled = false
    }
}
