//
//  CheckCodeVIew.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class CheckCodeView: UIView {
    var output: CheckCodeViewOutput!

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
