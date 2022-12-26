//
//  APIManager.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

protocol APIManagerable {
    func sendAuthCode(request: SendAuthCodeRequest) async throws -> SendAuthCodeResponse
    func checkAuthCode(request: CheckAuthCodeRequest) async throws -> CheckAuthCodeResponse
    func register(request: RegisterRequest) async throws -> RegisterResponse
}

final class APIManager {
    private let networkManager: NetworkManagable
    private let decoderManager: DecoderManagable

    init(
        networkManager: NetworkManagable,
        decoderManager: DecoderManagable
    ) {
        self.networkManager = networkManager
        self.decoderManager = decoderManager
    }
}

extension APIManager: APIManagerable {
    func sendAuthCode(request: SendAuthCodeRequest) async throws -> SendAuthCodeResponse {
        let response = try await networkManager.request(.sendAuthCode(request: request))
        return try decoderManager.decode(response)
    }
    
    func checkAuthCode(request: CheckAuthCodeRequest) async throws -> CheckAuthCodeResponse {
        let response = try await networkManager.request(.checkAuthCode(request: request))
        return try decoderManager.decode(response)
    }
    
    func register(request: RegisterRequest) async throws -> RegisterResponse {
        let response = try await networkManager.request(.register(request: request))
        return try decoderManager.decode(response)
    }
}
