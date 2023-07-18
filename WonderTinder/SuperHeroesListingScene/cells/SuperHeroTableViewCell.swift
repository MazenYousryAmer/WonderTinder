//
//  SuperHeroTableViewCell.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heroImage: UIImageView!

    func configureCell(superHero: WonderSuperHeroModel) {
        nameLabel.text = superHero.name
        heroImage.layer.cornerRadius = heroImage.frame.width / 2
        heroImage.layer.borderWidth = 2
        heroImage.layer.borderColor = superHero.isLiked ?? false ? UIColor.green.cgColor : UIColor.red.cgColor
        
        guard let url = URL(string: superHero.url ?? "") else {
            return
        }
        heroImage.downloadImage(from: url)
    }

}
