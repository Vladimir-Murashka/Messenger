//
//  EditProfileView.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

import UIKit
import FlagPhoneNumber

final class EditProfileView: UIView {
    var output: EditProfileViewOutput!

    // MARK: - Private properties

    private lazy var phoneTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.setFlag(key: .RU)
        textField.set(phoneNumber: "985 433-33-13")
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
            phoneTextField
        )
    }
    
    private func setupConstraints() {
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        
        NSLayoutConstraint.activate([
            phoneTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            phoneTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: defaultOffset)
        ])
    }
}
