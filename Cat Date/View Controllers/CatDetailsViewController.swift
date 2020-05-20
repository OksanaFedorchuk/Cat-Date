//
//  ViewController2.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 12.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class CatDetailsViewController: UIViewController {
    
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var matchCatImage: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var wikiLabel: UILabel!
    @IBOutlet weak var againButton: UIButton!
    
    var likedCat: Cat?
    let session = Session()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        session.getDataWith { [weak self] likedCat in
//            let catImageURL = likedCat.first?.url
//            DispatchQueue.main.async {
////                self?.setImage(catImageURL)
 
        matchLabel.text = "IT'S A MATCH! \n You and \(String(likedCat!.breeds.first!.name)) have liked each other!"
        
        temperamentLabel.text = likedCat?.breeds.first?.temperament
        descriptionLabel.text = likedCat?.breeds.first?.description
//        wikiLabel.text = likedCat?.breeds.first?.wikipedia_url
    }
    
    
    
    @IBAction func againButtonTapped(_ sender: Any) {
    }
    
    
    
    
    
}
