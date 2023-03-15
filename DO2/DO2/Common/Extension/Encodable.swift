//
//  Encodable.swift
//  DO2
//
//  Created by wyn on 2023/3/15.
//

import Foundation

extension Encodable {
    /// Sweeter: Export object to a dictionary representation
    func toDictionary() throws -> [String: Any]? {
        let data = try JSONEncoder().encode(self)
        let jsonData = try JSONSerialization.jsonObject(with: data)
        return jsonData as? [String: Any]
    }
}
