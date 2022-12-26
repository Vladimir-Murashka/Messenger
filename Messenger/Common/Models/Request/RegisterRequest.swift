//
//  RegisterRequest.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

struct RegisterRequest: Encodable {
    let phone: String
    let name: String
    let username: String
}
