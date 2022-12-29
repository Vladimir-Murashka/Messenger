//
//  AuthDIContainer.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

import UIKit

final class AuthDIContainer {
    private let dependencies: AuthModuleDependencies

    init(dependencies: AuthModuleDependencies) {
        self.dependencies = dependencies
    }

    func makeAuthViewController(router: AuthRouterInput) -> UIViewController {
        let dependencies = AuthDependencies(
            router: router,
            apiManager: dependencies.apiManager
        )
        let assembly = AuthAssembly(dependencies: dependencies)

        return assembly.build()
    }
    
    func makeCheckCodeViewController(router: CheckCodeRouterInput, phone: String, phoneForTextFeild: String) -> UIViewController {
        let dependencies = CheckCodeDependencies(
            router: router,
            apiManager: dependencies.apiManager
        )
        let assembly = CheckCodeAssembly(dependencies: dependencies)

        return assembly.build(phone: phone, phoneForTextFeild: phoneForTextFeild)
    }
    
    func makeRegisterViewController(router: RegisterRouterInput, phone: String, phoneForTextFeild: String) -> UIViewController {
        let dependencies = RegisterDependencies(
            router: router,
            apiManager: dependencies.apiManager
        )
        let assembly = RegisterAssembly(dependencies: dependencies)

        return assembly.build(phone: phone, phoneForTextFeild: phoneForTextFeild)
    }
}
