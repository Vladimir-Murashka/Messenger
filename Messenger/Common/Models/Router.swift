//
//  Router.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

protocol Router: AnyObject {
    func push(_ viewController: UIViewController)
    func setRoot(
        _ viewController: UIViewController,
        animated: Bool
    )
}
