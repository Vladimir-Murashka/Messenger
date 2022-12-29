//
//  NetworkManager.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Moya

protocol NetworkManagable {
    func request(_ target: Users) async throws -> Data
}

final class NetworkManager {
    private let tokensStorage: TokensStorage
    private lazy var provider = MoyaProvider<Users>(plugins: [
        AuthPlugin(tokenClosure: { [unowned self] in
            self.tokensStorage.accessToken
        }),
        LoggerPlugin()
    ])

    init(tokensStorage: TokensStorage) {
        self.tokensStorage = tokensStorage
    }
}

extension NetworkManager: NetworkManagable {
    func request(_ target: Users) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(target) { result in
                switch result {
                case let .success(response):
                    switch response.statusCode {
                    case 200...201:
                        continuation.resume(returning: response.data)
                    case 401:
                        continuation.resume(throwing: URLError(.userAuthenticationRequired))
                    default:
                        do {
                            let errorResponse: ErrorResponse = try DecoderManager().decode(response.data)
                            print(errorResponse)
                        } catch {
                            print(error)
                        }
                        continuation.resume(throwing: URLError(.badServerResponse))
                    }
                case let .failure(error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
