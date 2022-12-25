//
//  Moya.Task.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Moya

extension Moya.Task {
    static func requestWithBodyParameters(from request: Encodable) -> Moya.Task {
        return .requestCompositeParameters(
            bodyParameters: request.makeBodyParameters(),
            bodyEncoding: JSONEncoding(),
            urlParameters: [:]
        )
    }
}
