//
//  ViewController.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import UIKit

class SuperHeroesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CharactersWorker().getCharacters()
    }
    
    func getList() {
        
    }


}

