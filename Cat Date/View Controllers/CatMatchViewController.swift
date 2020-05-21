//
//  ViewController.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 30.04.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class CatMatchViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var invitationLabel: UILabel!
    @IBOutlet weak var catImage1: UIImageView!
    @IBOutlet weak var dislikeButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    // MARK: - Constants and Variables
    
    let session = Session()
    var likedCat: Cat?
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        invitationLabel.text = "WILL YOU BE MY MATCH?"
        
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
    
    func getData() {
        
        session.getDataWith { [weak self] cats in
            self?.likedCat = cats.first
            let catImageURL = cats.first?.url
            DispatchQueue.main.async {
                self?.setImage(catImageURL)
            }
        }
    }

    
    // MARK: - Getting a Cat Match
    
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
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMatch" {
            let catDetails = segue.destination as? CatDetailsViewController
            catDetails?.likedCat = likedCat
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        getData()
    }
    
}
