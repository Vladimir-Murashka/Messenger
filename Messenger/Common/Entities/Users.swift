//
//  Users.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Moya

enum Users {
    case sendAuthCode(request: SendAuthCodeRequest)
    case checkAuthCode(request: CheckAuthCodeRequest)
    case register(request: RegisterRequest)
    case getUser
    case updateUser
    case refreshToken
    case checkJWT
}

extension Users: AuthorizedTargetType {
    var baseURL: URL {
        return URL(string: "https://plannerok.ru")!
    }

    var path: String {
        switch self {
        case .sendAuthCode:
            return "/api/v1/users/send-auth-code/"
        case .checkAuthCode:
            return "/api/v1/users/check-auth-code/"
        case .register:
            return "/api/v1/users/register/"
        case .getUser, .updateUser:
            return "/api/v1/users/me/"
        case .refreshToken:
            return "/api/v1/users/refresh-token/"
        case .checkJWT:
            return "/api/v1/users/check-jwt/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .sendAuthCode,
             .checkAuthCode,
             .register,
             .refreshToken:
            return .post
        case .getUser, .checkJWT:
            return .get
        case .updateUser:
            return .post
        }
    }

    var task: Moya.Task {
        switch self {
        case .getUser,
             .checkJWT:
            return .requestPlain
        case let .sendAuthCode(request):
            return .requestWithBodyParameters(from: request)
        case let .checkAuthCode(request: request):
            return .requestWithBodyParameters(from: request)
        case let .register(request: request):
            return .requestWithBodyParameters(from: request)
        default:
            return .requestCompositeParameters(
                bodyParameters: [:],
                bodyEncoding: JSONEncoding(),
                urlParameters: [:]
            )
        }
    }

    var headers: [String : String]? {
        nil
    }

    var needsAuth: Bool {
        switch self {
        case .sendAuthCode,
             .checkAuthCode,
             .register:
            return false
        case .getUser,
             .updateUser,
             .refreshToken,
             .checkJWT:
            return true
        }
    }
}
