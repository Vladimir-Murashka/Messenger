//
//  ErrorResponse.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

struct ErrorResponse: Decodable {
    let detail: [ErrorDetail]
}
