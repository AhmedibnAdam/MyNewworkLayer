//
//  CodableInit.swift
//  MyNewworkLayer
//
//  Created by Adam on 7/23/19.
//  Copyright © 2019 Adam. All rights reserved.
//


import Foundation

protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
}

