//
//  CheckAuthCodeRequest.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

struct CheckAuthCodeRequest: Encodable {
    let phone: String
    let code: String
}
