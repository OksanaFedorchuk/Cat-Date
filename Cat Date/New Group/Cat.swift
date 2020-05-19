//
//  File.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 05.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import Foundation

struct Cat: Codable {
    
    var url: URL
    var breeds: [Breed]
}

struct Breed: Codable {
    
    var id: String
    var name: String
    var temperament: String
    var description: String
    var wikipedia_url: URL
}

