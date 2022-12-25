//
//  KeychainManger.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Foundation

enum KeychainKey: String {
    case accessToken
    case refreshToken
}

protocol Keychainangerable {
    func save(_ string: String, for key: KeychainKey)
    func fetch(for key: KeychainKey) -> String
    func remove(for key: KeychainKey)
}

final class KeychainManger {}

extension KeychainManger: Keychainangerable {
    func save(_ string: String, for key: KeychainKey) {}
    func fetch(for key: KeychainKey) -> String { "" }
    func remove(for key: KeychainKey) {}
}

protocol TokensStorage {
    var accessToken: String { get }
    var refreshToken: String { get }
}

extension KeychainManger: TokensStorage {
    var accessToken: String {
        fetch(for: .accessToken)
    }

    var refreshToken: String {
        fetch(for: .refreshToken)
    }
}

