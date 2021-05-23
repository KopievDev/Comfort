//
//  ClientsModel.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import Foundation

struct Client: Codable {
    var name: String
    var adress: String?
    var phone: String
    var realtyType: String?
    var dealType: String
}

