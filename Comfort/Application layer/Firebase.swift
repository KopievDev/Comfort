//
//  Firebase.swift
//  Comfort
//
//  Created by Ivan Kopiev on 18.05.2021.
//

import Foundation

class Firebase {
    
    var users: [[String:String]] = [
        ["elon@mask.ru":"tesla"],
        ["tony@stark.ru":"ironman"],
        ["rick@sanchez.ru":"morty"],
        ["kopiev@x.ru":"vns"],
        ["1":"1"]
    ]
    
    
    func auth(login: String, password: String) -> Bool {
        if users.contains([login : password]){
            return true
        } else {
            return false
        }
    }
}
