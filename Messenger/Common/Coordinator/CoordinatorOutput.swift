//
//  CoordinatorOutput.swift
//  Messenger
//
//  Created by Swift Learning on 26.12.2022.
//

protocol CoordinatorOutput: Coordinator {
    var onFinish: (() -> Void)? { get set }
}
