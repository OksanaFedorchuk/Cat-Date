//
//  ViewController.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 30.04.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class ViewController1: UIViewController, DataDelegate {
  
    @IBOutlet weak var invitationLabel: UILabel!
    @IBOutlet weak var catImage1: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    let session = Session()
    var catDescription: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session.getData()
        self.invitationLabel.text = self.session.catBreed
        
        
        
//        invitationLabel.text = catDescription
        //get data and update: label, image
        
        // Do any additional setup after loading the view.
    }
    
        func didReceiveCatData(_ cat: [Cat]) {
            catDescription = cat.first?.breeds.first?.name
    
          }
    
    @IBAction func dislikeTapped(_ sender: Any) {
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        session.getData()
        invitationLabel.text = session.catBreed
//        catImage1.image = session.catImage
        
    }
    
}
