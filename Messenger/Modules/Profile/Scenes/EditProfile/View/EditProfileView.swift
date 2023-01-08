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
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.layer.cornerRadius = 75
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .cyan
        return imageView
    }()
    
    private lazy var newImageAvatarButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: "Roboto", size: 16)
        button.setTitle("Новое фото", for: .normal)
        button.titleLabel?.textColor = .systemBlue
        button.addTarget(self, action: #selector(didTapNewImageAvatarButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var phoneTextField: FPNTextField = {
        let textField = FPNTextField()
        textField.font = UIFont(name: "Roboto", size: 20)
        textField.setFlag(key: .RU)
        textField.set(phoneNumber: "985 433-33-13")
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.font = UIFont(name: "Roboto", size: 16)
        textField.placeholder = "Имя"
        return textField
    }()
    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 14)
        label.textColor = .systemGray6
        label.numberOfLines = 0
        label.textColor = .systemTeal
        label.text = "Укажите свое имя, город проживания, дату рождения и загрузите фотографию профиля"
        return label
    }()
    
    private let cityTextField: UITextField = {
        let textField = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.font = UIFont(name: "Roboto", size: 16)
        textField.placeholder = "Город"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemTeal.cgColor
        return textField
    }()
    
    private lazy var birthdayTextField: UITextField = {
        let textField = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.font = UIFont(name: "Roboto", size: 16)
        textField.placeholder = "Дата рождения"
        textField.delegate = self
        return textField
    }()
    
    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.cornerRadius = 8
        stackView.layer.masksToBounds = true
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.systemTeal.cgColor
        return stackView
    }()
    
    private let aboutMeTextField: UITextField = {
        let textField = UITextField()
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        textField.font = UIFont(name: "Roboto", size: 16)
        textField.placeholder = "О себе"
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemTeal.cgColor
        return textField
    }()
    
    private let infoAboutMeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 14)
        label.textColor = .systemGray6
        label.numberOfLines = 0
        label.textColor = .systemTeal
        label.text = "Любые подробности, например: род занятий, любимый вид спорта."
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
    
    @objc
    private func didTapNewImageAvatarButton() {
        print(#function)
    }
    

    private func setupView() {
        backgroundColor = .systemBackground
        addSubViews()
        setupConstraints()
    }
    
    private func addSubViews() {
        addSubviews(
            avatarImageView,
            newImageAvatarButton,
            phoneTextField,
            nameStackView,
            infoLabel,
            aboutMeTextField,
            infoAboutMeLabel
        )
        
        nameStackView.addArrangedSubviews(
            nameTextField,
            cityTextField,
            birthdayTextField
        )
    }
    
    private func setupConstraints() {
        let avatarImagiViewSize: CGFloat = 150
        let defaultOffset: CGFloat = 16
        let defaultHeigth: CGFloat = 50
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: avatarImagiViewSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: avatarImagiViewSize),
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            newImageAvatarButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            newImageAvatarButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            
            phoneTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            phoneTextField.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            phoneTextField.topAnchor.constraint(equalTo: newImageAvatarButton.bottomAnchor),
            
            nameTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            cityTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            birthdayTextField.heightAnchor.constraint(equalToConstant: defaultHeigth),
            aboutMeTextField.heightAnchor.constraint(equalToConstant: defaultHeigth * 2),
            
            nameStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            nameStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            nameStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: defaultOffset),
            
            infoLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            infoLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            infoLabel.topAnchor.constraint(equalTo: nameStackView.bottomAnchor),
            
            aboutMeTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            aboutMeTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            aboutMeTextField.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: defaultOffset),
            aboutMeTextField.bottomAnchor.constraint(equalTo: infoAboutMeLabel.topAnchor),
            
            infoAboutMeLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: defaultOffset),
            infoAboutMeLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -defaultOffset),
            infoAboutMeLabel.topAnchor.constraint(equalTo: aboutMeTextField.bottomAnchor)
        ])
    }
}

extension EditProfileView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == birthdayTextField {
            if birthdayTextField.text?.count == 2 || birthdayTextField.text?.count == 5 {
                if !(string == "") {
                    birthdayTextField.text = birthdayTextField.text! + "."
                }
            }
            return !(textField.text!.count > 9 && (string.count ) > range.length)
        } else {
            return true
        }
    }
}
