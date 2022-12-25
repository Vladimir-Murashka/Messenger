//
//  ErrorDetail.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

struct ErrorDetail: Decodable {
    let loc: [String]
    let msg: String
    let type: String
}
