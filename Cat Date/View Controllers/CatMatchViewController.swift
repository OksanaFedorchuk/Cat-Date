//
//  ViewController.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 30.04.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class CatMatchViewController: UIViewController {
    
    @IBOutlet weak var invitationLabel: UILabel!
    @IBOutlet weak var catImage1: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    
    let session = Session()
    var catDescription: String? = ""
    var likedCat: Cat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        invitationLabel.text = "Like or Not Really?"
//        self.invitationLabel.text = self.session.catBreed
    }
    
    // MARK: - Image Methods
    
    func setImage(_ url: URL?) {
        guard let imageURL = url else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.catImage1.image = image
            }
        }
    }
    
    func catLikeGenerator() -> Int {
        let catLike = [0, 1]
        let randomLike = catLike.randomElement()
        return randomLike!
        }
    
    @IBAction func dislikeTapped(_ sender: Any) {
        getData()
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        
        if catLikeGenerator() == 1 {
            performSegue(withIdentifier: "goToMatch", sender: Any?.self)
            
        } else {
            getData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMatch" {
            let catDetails = segue.destination as? CatDetailsViewController
            catDetails?.likedCat = likedCat
        }
    }
    
    func getData() {
        
        session.getDataWith { [weak self] cats in
            self?.likedCat = cats.first
            let catImageURL = cats.first?.url
            DispatchQueue.main.async {
                self?.setImage(catImageURL)
            }
        }
    }
}
