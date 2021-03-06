//
//  Parser.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import Foundation

class Parser {
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError.localizedDescription)
            return nil
        }
    }
    
    func encodeJSON<T: Encodable>(type: T.Type, data: T ) -> Data? {
        let encoder = JSONEncoder()
        do {
            let encoderData = try encoder.encode(data)
            return encoderData
        } catch let jsonError {
            print("Failed to encode JSON", jsonError.localizedDescription)
            return nil
        }
    }
    
}
