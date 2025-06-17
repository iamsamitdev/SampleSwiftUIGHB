//
//  User.swift
//  ShopetizersGHB
//
//  Created by Samit Koyom on 17/6/2568 BE.
//

import Foundation

struct User: Codable {
    var firstname           = ""
    var lastname            = ""
    var email               = ""
    var birthdate           = Date()
    var extraNapkins        = true
    var frequentRefills     = false
}
