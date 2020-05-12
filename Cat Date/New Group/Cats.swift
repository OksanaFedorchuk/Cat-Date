//
//  File.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 05.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import Foundation

struct Cats: Codable {
    
    struct Cat: Codable {
        
        var name: String
        var origin: String
        var temperament: String
        var description: String
        var wikipediaURL: URL
        
    }
    
    var catsArray: [Cat]
    
}
