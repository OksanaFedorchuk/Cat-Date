//
//  ViewController2.swift
//  Cat Date
//
//  Created by Oksana Fedorchuk on 12.05.2020.
//  Copyright © 2020 Oksana Fedorchuk. All rights reserved.
//

import UIKit

class CatDetailsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var matchLabel: UILabel!
    @IBOutlet weak var matchCatImage: UIImageView!
    @IBOutlet weak var temperamentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Constants and Variables
    
    var likedCat: Cat?
    let session = SessionManager()
    
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()
        
        matchLabel.text = "IT'S A MATCH! \n You and \(String(likedCat!.breeds.first!.name)) have liked each other!"
        
        temperamentLabel.text = likedCat?.breeds.first?.temperament
        descriptionLabel.text = likedCat?.breeds.first?.description
    }
    
    // MARK: - Button Actions
    
    @IBAction func learnMoreButtonTapped(_ sender: Any) {
        UIApplication.shared.open(likedCat!.breeds.first!.wikipedia_url as URL, completionHandler: nil)
    }
    
    @IBAction func getAnotherButtonTapped(_ sender: Any) {
        
        dismiss(animated: true)
        
    }
    
    // MARK: - Image Methods
    
    private func setImage() {
        guard let imageURL = likedCat?.url else { return }
        
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.matchCatImage.image = image
            }
        }
    }
}
