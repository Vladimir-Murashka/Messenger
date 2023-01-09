//
//  DecoderManager.swift
//  Messenger
//
//  Created by Swift Learning on 09.01.2023.
//

import Foundation

protocol DecoderManagable {
    func decode<T: Decodable>(_ data: Data) throws -> T
}

final class DecoderManager {}

extension DecoderManager: DecoderManagable {
    func decode<T: Decodable>(_ data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }
}
