//
//  RegisterResponse.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

struct RegisterResponse: Decodable {
    let refreshToken: String?
    let accessToken: String?
    let userID: Int?
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
        case accessToken = "access_token"
        case userID = "user_id"
    }
}

