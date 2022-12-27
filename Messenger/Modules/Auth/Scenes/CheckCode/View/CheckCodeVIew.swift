//
//  CheckCodeVIew.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit
import AEOTPTextField

final class CheckCodeView: UIView {
    var output: CheckCodeViewOutput!

    // MARK: - Private properties

    private let logo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var checkCodeTextField: AEOTPTextField = {
        let textField = AEOTPTextField()
        textField.otpTextColor = .systemTeal
        textField.otpBackgroundColor = .systemGray
        textField.otpFilledBackgroundColor = .clear
        textField.otpFilledBorderWidth = 2
        textField.otpFilledBorderColor = .systemTeal
        textField.otpFont = UIFont(name: "Roboto", size: 18) ?? UIFont.systemFont(ofSize: 18)
        textField.configure(with: 6)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Roboto", size: 20)
        button.setTitle("Проверить", for: .normal)
        button.tintColor = .systemTeal
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemTeal.cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapSendCodeButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
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
    private func didTapSendCodeButton() {
        output.sendCodeButtonPressed(code: "")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubview(logo)
        addSubview(checkCodeTextField)
        addSubview(sendButton)
    }
    
    private func setupConstraints() {
        let logoSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        let checkCodeTextFieldTopOffset: CGFloat = 64
        
        NSLayoutConstraint.activate([
            logo.widthAnchor.constraint(equalToConstant: logoSize),
            logo.heightAnchor.constraint(equalToConstant: logoSize),
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultOffset),
            logo.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            checkCodeTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            checkCodeTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            checkCodeTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            checkCodeTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: checkCodeTextFieldTopOffset),
            
            sendButton.heightAnchor.constraint(equalToConstant: defaultHeigth),
            sendButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            sendButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            sendButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}
