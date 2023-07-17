//
//  SuperHeroTableViewCell.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import UIKit

class SuperHeroTableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var colorView: UIView!

    func configureCell(superHero: WonderSuperHeroModel) {
        nameLabel.text = superHero.name
        colorView.backgroundColor = superHero.isLiked ?? false ? .green : .red
    }

}
