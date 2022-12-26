//
//  RegisterView.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

import UIKit

final class RegisterView: UIView {
    var output: RegisterViewOutput!

    // MARK: - Private properties

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

}
