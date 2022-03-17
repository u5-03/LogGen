//
//  JSONEncoder+TypeInference.swift
//  LogGen
//
//  Created by yugo.sugiyama on 2022/03/17.
//

import Foundation

public extension Encodable {
    func encoded(using encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        try encoder.encode(self)
    }

    func asDictionary(using encoder: JSONEncoder = JSONEncoder(), keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys) throws -> [String: Any] {
        encoder.keyEncodingStrategy = keyEncodingStrategy
        let data = try encoded(using: encoder)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let dictionary = jsonObject as? [String: Any] else {
            throw EncodingError.invalidValue(jsonObject, EncodingError.Context(codingPath: [], debugDescription: "Object is not of type [String: Any]"))
        }

        return dictionary
    }
}
