//
//  ProfileView.swift
//  Messenger
//
//  Created by Swift Learning on 30.12.2022.
//

import UIKit
import FlagPhoneNumber

final class ProfileView: UIView {
    var output: ProfileViewOutput!

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
        return textField
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

    private func setupView() {
        backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubviews(
            logoImageView,
            phoneTextField
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
            phoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: phoneTextFieldTopOffset)
        ])
    }
}

