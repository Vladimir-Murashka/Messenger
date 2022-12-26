//
//  BaseCoordinator.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []

    func start() {}
}

extension BaseCoordinator {
    func addChild(_ coordinator: Coordinator) {
        guard
            !childCoordinators
                .contains(where: { $0 === coordinator })
        else {
            return
        }

        childCoordinators.append(coordinator)
    }

    func removeChild(_ coordinator: Coordinator?) {
        guard
            !childCoordinators.isEmpty,
            let coordinator = coordinator
        else {
            return
        }

        if let coordinator = coordinator as? BaseCoordinator,
           !coordinator.childCoordinators.isEmpty {

            coordinator.childCoordinators
                .filter { $0 !== coordinator }
                .forEach { coordinator.removeChild($0) }
        }

        for (index, element) in childCoordinators
            .enumerated() where element === coordinator {

            childCoordinators.remove(at: index)
            break
        }
    }
}

