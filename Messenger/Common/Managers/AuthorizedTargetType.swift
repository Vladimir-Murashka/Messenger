//
//  AuthorizedTargetType.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Moya

protocol AuthorizedTargetType: TargetType {
    var needsAuth: Bool { get }
}
