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
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()

    private let phoneTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.setFlag(key: .RU)
        textField.set(phoneNumber: "985 433-33-13")
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = "Максим"
        label.textAlignment = .center
        return label
    }()
    
    private let userSeparatorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = ":"
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = "Hologen"
        label.textAlignment = .center
        return label
    }()
    
    private let userStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = "Город"
        label.textAlignment = .center
        return label
    }()
    
    private let citySeparatorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = ":"
        label.textAlignment = .center
        return label
    }()
    
    private let nameCityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = "Краснодар"
        label.textAlignment = .center
        return label
    }()
    
    private let cityStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let birthdayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 18)
        label.text = "Дата рождения"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let birthdaySeparatorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = ":"
        label.textAlignment = .center
        return label
    }()
    
    private let birthdayDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = "13.02.1991"
        label.textAlignment = .center
        return label
    }()
    
    private let birthdayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let zodiacSingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 18)
        label.text = "Знак зодиака"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let zodiacSingSeparatorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.text = ":"
        label.textAlignment = .center
        return label
    }()
    
    private let zodiacSingImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    private let zodiacStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let commonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        return stackView
    }()
    
    private let aboutMeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.textAlignment = .center
        label.text = "Что-то о себе"
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.systemTeal.cgColor
        return label
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
            avatarImageView,
            phoneTextField,
            commonStackView,
            aboutMeLabel
        )
        
        userStackView.addArrangedSubviews(
            nameLabel,
            userSeparatorLabel,
            userNameLabel
        )
        
        cityStackView.addArrangedSubviews(
            cityLabel,
            citySeparatorLabel,
            nameCityLabel
        )
        
        birthdayStackView.addArrangedSubviews(
            birthdayLabel,
            birthdaySeparatorLabel,
            birthdayDateLabel
        )
        
        zodiacStackView.addArrangedSubviews(
            zodiacSingLabel,
            zodiacSingSeparatorLabel,
            zodiacSingImageView
        )
        
        commonStackView.addArrangedSubviews(
            userStackView,
            cityStackView,
            birthdayStackView,
            zodiacStackView
        )
    }
    
    private func setupConstraints() {
        let avatarImagiViewSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        let defaultWidth: CGFloat = 50
        let phoneTextFieldTopOffset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImagiViewSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImagiViewSize),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            phoneTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            phoneTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: phoneTextFieldTopOffset),
            
            userStackView.heightAnchor.constraint(equalToConstant: defaultHeigth),
            cityStackView.heightAnchor.constraint(equalToConstant: defaultHeigth),
            birthdayStackView.heightAnchor.constraint(equalToConstant: defaultHeigth),
            
            zodiacSingImageView.heightAnchor.constraint(equalToConstant: defaultHeigth),
            zodiacSingImageView.widthAnchor.constraint(equalToConstant: defaultWidth),
            
            commonStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor),
            commonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            commonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            
            aboutMeLabel.topAnchor.constraint(equalTo: commonStackView.bottomAnchor, constant: defaultOffset),
            aboutMeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            aboutMeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            aboutMeLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -defaultOffset)
        ])
    }
}

