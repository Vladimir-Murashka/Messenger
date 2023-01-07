//
//  EditProfilePresenter.swift
//  Messenger
//
//  Created by Swift Learning on 07.01.2023.
//

final class EditProfilePresenter {
    weak var view: EditProfileViewInput!
    var interactor: EditProfileInteractorInput!
    weak var router: EditProfileRouterInput!
    
    private var phoneForTextFeild: String = ""

    init() {}
}

extension EditProfilePresenter: EditProfileViewOutput {
    func editButtonPressed() {}
}

extension EditProfilePresenter: EditProfileInteractorOutput {
    func didPutUserSuccessfully() {}
    
    func didPutUserFailure(error: Error) {}
}
