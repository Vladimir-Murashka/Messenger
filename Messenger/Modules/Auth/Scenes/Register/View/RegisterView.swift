//
//  RegisterView.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

import UIKit
import FlagPhoneNumber

final class RegisterView: UIView {
    var output: RegisterViewOutput!

    // MARK: - Private properties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    private let phoneTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.setFlag(key: .RU)
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.placeholder = "Введите имя"
        textField.textColor = .systemTeal
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.systemTeal.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.textAlignment = .center
        return textField
    }()
    
    private let userNameTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.placeholder = "Введите Никнейм"
        textField.textColor = .systemTeal
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.systemTeal.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.textAlignment = .center
        return textField
    }()
    
    private let textFieldStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Roboto", size: 20)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.tintColor = .systemTeal
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemTeal.cgColor
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
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
    private func didTapRegisterButton() {
        output.registerButtonPressed(name: nameTextField.text ?? "", userName: userNameTextField.text ?? "")
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
            registerButton,
            textFieldStackView
        )
        
        textFieldStackView.addArrangedSubviews(
            nameTextField,
            userNameTextField
        )
    }
    
    private func setupConstraints() {
        let logoSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        let textFieldTopOffset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: logoSize),
            logoImageView.heightAnchor.constraint(equalToConstant: logoSize),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultOffset),
            logoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
        
            phoneTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            phoneTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: textFieldTopOffset),
            
            nameTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            userNameTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            
            textFieldStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            textFieldStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            textFieldStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: defaultOffset),
            
            registerButton.heightAnchor.constraint(equalToConstant: defaultHeigth),
            registerButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            registerButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -defaultOffset)
        ])
    }
}

extension RegisterView {
    func updatePhoneTextField(for number: String) {
        phoneTextField.set(phoneNumber: number)
    }
}
