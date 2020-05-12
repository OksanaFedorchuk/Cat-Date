//
//  Session.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 11.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import Foundation

class Session {
    
    func getData () {
        
        let session = URLSession.shared
        
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?breed_ids=bali") else {
            error
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
        }
    }
} 
