//
//  CheckCodeInteractor.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

final class CheckCodeInteractor {
    weak var output: CheckCodeInteractorOutput!

    // MARK: - Private properties

    private let apiManager: APIManagerable

    init(apiManager: APIManagerable) {
        self.apiManager = apiManager
    }
}

extension CheckCodeInteractor: CheckCodeInteractorInput {
    func checkAuthCode(request: CheckAuthCodeRequest) {
        Task {
            do {
                let response = try await apiManager.checkAuthCode(request: request)
                
                await MainActor.run {
                    output.didCheckAuthCodeSuccessfully(response: response)
                }
            } catch {
                await MainActor.run {
                    output.didCheckAuthCodeFailure(error: error)
                }
            }
        }
    }
}
