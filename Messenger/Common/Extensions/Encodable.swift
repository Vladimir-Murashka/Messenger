//
//  Encodable.swift
//  Messenger
//
//  Created by Swift Learning on 25.12.2022.
//

import Foundation

extension Encodable {
    func makeBodyParameters() -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            let dictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return dictionary ?? [:]
        } catch {
            return [:]
        }
    }
}
