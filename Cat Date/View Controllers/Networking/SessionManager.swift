//
//  Session.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 11.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import Foundation
import UIKit

enum HTTPMethod: String {
    case GET
    case POST
}
class SessionManager {
    
    // MARK: - Constants and Variables
    
    let session = URLSession.shared
    var dataTask: URLSessionDataTask?
    
    // MARK: - BreedID Request
    
    func getBreedIDsWith(completion: @escaping (([BreedID]) -> Void)) {
        guard let idURL = URL(string: "https://api.thecatapi.com/v1/breeds") else { fatalError("Error getting a cat breed URL") }
        var requestIDs = URLRequest(url: idURL)
        requestIDs.httpMethod = HTTPMethod.GET.rawValue
        
        requestIDs.addValue("a4f188d4-b187-40c8-820f-fd4ca898885e", forHTTPHeaderField: "x-api-key")
        session.dataTask(with: requestIDs) { (data, response, error) in
            if let data = data {
                do {
                    let breedIDs = try JSONDecoder().decode([BreedID].self, from: data)
                    completion(breedIDs)
                } catch {
                    completion([])
                }
            }
        }.resume()
    }
    
    func getRandomCatImageURL(completion: @escaping ((String) -> Void)) {
        
        getBreedIDsWith { breedIDs in
            let randomBreedId = breedIDs.map { $0.id }.randomElement()
            let imageURLString = "https://api.thecatapi.com/v1/images/search?breed_ids=\(randomBreedId!)"
            completion(imageURLString)
        }
    }
    
    // MARK: - Cat Request
    
    func getCat(completion: @escaping ((Cat?) -> Void)) {
        
        getRandomCatImageURL { [weak self] url in
            guard let url = URL(string: "\(url)") else {
                fatalError("Error getting a cat breed URL")
            }
            var request = URLRequest(url: url)
            request.httpMethod = HTTPMethod.GET.rawValue
            request.addValue("a4f188d4-b187-40c8-820f-fd4ca898885e", forHTTPHeaderField: "x-api-key")
            
            self?.session.dataTask(with: request) { (data, response, error) in
                
                if let data = data {
                    do {
                        let cats = try JSONDecoder().decode([Cat].self, from: data)
                        completion(cats.first)
                    } catch {
                        completion(nil)
                    }
                }
            }.resume()
        }
        
    }
} 
