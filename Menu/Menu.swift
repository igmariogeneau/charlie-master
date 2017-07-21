//
//  Menu.swift
//  Menu
//
//  Created by eleves on 17-07-20.
//  Copyright © 2017 eleves. All rights reserved.
//

import Foundation

class Menu {
    var image: String
    var price: Double
    var name: String
    var choices: [String]
    init(image: String, price: Double, name: String, choices: [String]) {
        self.image = image
        self.price = price
        self.name = name
        self.choices = choices
    }
}
