//
//  RegisterInteractor.swift
//  Messenger
//
//  Created by Swift Learning on 27.12.2022.
//

final class RegisterInteractor {
    weak var output: RegisterInteractorOutput!

    // MARK: - Private properties

    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }
}

extension RegisterInteractor: RegisterInteractorInput {
    func register(request: RegisterRequest) {
        Task {
            do {
                let response = try await apiManager.register(request: request)
                
                await MainActor.run {
                    output.didRegisterSuccessfully(response: response)
                }
            } catch {
                await MainActor.run {
                    output.didRegisterFailure(error: error)
                }
            }
        }
    }
}
