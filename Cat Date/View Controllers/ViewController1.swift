//
//  ViewController.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 30.04.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var invitationLabel: UILabel!
    @IBOutlet weak var catImage1: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    let session = Session()
    var catDescription: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session.getData()
        setImage()
        
        self.invitationLabel.text = self.session.catBreed
    }
    
    func setImage() {
        guard let imageURL = session.catImageURL else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.catImage1.image = image
            }
        }
    }
    
    @IBAction func dislikeTapped(_ sender: Any) {
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        session.getData()
        setImage()
        invitationLabel.text = session.catBreed
        
    }
    
}
