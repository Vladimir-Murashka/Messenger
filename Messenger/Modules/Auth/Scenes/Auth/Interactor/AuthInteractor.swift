//
//  AuthInteractor.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class AuthInteractor {
    weak var output: AuthInteractorOutput!

    // MARK: - Private proprties

    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }
}

extension AuthInteractor: AuthInteractorInput {
    func sendAuthCode(request: SendAuthCodeRequest) {
        Task {
            do {
                let response = try await apiManager.sendAuthCode(request: request)

                await MainActor.run {
                    output.didSendAuthCodeSuccessfully(response: response)
                }
            } catch {
                await MainActor.run {
                    output.didSendAuthCodeFailure(error: error)
                }
            }
        }
    }
}
