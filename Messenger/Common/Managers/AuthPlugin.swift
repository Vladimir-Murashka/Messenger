//
//  AuthPlugin.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Moya

struct AuthPlugin: PluginType {
    let tokenClosure: () -> String?

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard
            let token = tokenClosure(),
            let authTarget = target as? AuthorizedTargetType,
            authTarget.needsAuth
        else {
            return request
        }

        var request = request
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}

struct LoggerPlugin: PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        if let urlString = request.request?.url?.absoluteString {
            print("\(Date()) request \(urlString)")
        }
    }

    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .success(let success):
            if let urlString = success.request?.url?.absoluteString {
                print("\(Date()) response \(urlString) \(success.statusCode)")
            }
        case .failure(let failure):
            print("Logger: \(Date()) - Error \(failure.localizedDescription)")
        }
    }
}
