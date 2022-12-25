//
//  SendAuthCodeResponse.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

struct SendAuthCodeResponse: Decodable {
    let isSuccess: Bool

    enum CodingKeys: String, CodingKey {
        case isSuccess = "is_success"
    }
}
