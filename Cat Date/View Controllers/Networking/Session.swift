//
//  Session.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 11.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import Foundation
import UIKit

class Session {
    
    let session = URLSession.shared
//    var catBreed: String = ""
//    var catImageURL = URL(string: "")
    
    let catArray: [String] = ["abys", "aege", "abob", "acur", "asho", "awir", "amau", "amis", "bali", "bamb", "beng", "birm", "bomb", "bslo", "bsho", "bure", "buri", "cspa", "ctif", "char", "chau", "chee", "csho", "crex", "cymr", "cypr", "drex", "dons", "lihu", "emau", "ebur", "esho", "hbro", "hima", "jbob", "java", "khao", "kora", "kuri", "lape", "mcoo", "mala", "manx", "munc", "nebe", "norw", "ocic", "orie", "pers", "pixi", "raga", "ragd", "rblu", "sava", "sfol", "srex", "siam", "sibe", "sing", "snow", "soma", "sphy", "tonk", "toyg", "tang", "tvan"]
    
    
    var dataTask: URLSessionDataTask?
    
    func getRandomCat() -> String {
        let breedID: String = String(catArray.randomElement()!)
        let resourceString = "https://api.thecatapi.com/v1/images/search?breed_ids=\(breedID)"
        return resourceString
    }
    
    func getDataWith(completion: @escaping (([Cat]) -> Void)) {
        
        
        guard let url = URL(string: "\(getRandomCat())") else {
            fatalError("Error getting a cat breed URL")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("a4f188d4-b187-40c8-820f-fd4ca898885e", forHTTPHeaderField: "x-api-key")
        
        session.dataTask(with: request) { (data, response, error) in
            
            if let data = data {
                do {
                    let cats = try JSONDecoder().decode([Cat].self, from: data)
                    completion(cats)
                } catch {
                    completion([])
                }
            }
        }.resume()
    }
} 
