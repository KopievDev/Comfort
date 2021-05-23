//
//  RealtyModel.swift
//  ComfortApp
//
//  Created by Ivan Kopiev on 22.05.2021.
//

import Foundation

struct Realty: Codable {
    
    var price: Float // Стоимость
    var numberOfRooms: Int // Кол-во комнат
    var square: Float // Общая площадь
    var image: String // Фото или планировка недвижимости
    var adress: String // Адрес
    var rent: Bool // true - недвижимость под аренду
    var typeRealty: String
    var description: String?
}
