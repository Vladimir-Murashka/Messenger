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

    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
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
        textField.otpDelegate = self
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
            checkCodeTextField
        )
    }
    
    private func setupConstraints() {
        let logoSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalToConstant: logoSize),
            logoImageView.heightAnchor.constraint(equalToConstant: logoSize),
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultOffset),
            logoImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            checkCodeTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            checkCodeTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            checkCodeTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            checkCodeTextField.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

extension CheckCodeView: AEOTPTextFieldDelegate {
    func didUserFinishEnter(the code: String) {
        print(code)
        output.didUserFinishEnter(code: code)
    }
}

extension CheckCodeView {
    func clearOTP() {
        checkCodeTextField.clearOTP()
    }
}
