//
//  ViewController.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import UIKit

protocol ViewControllerInterface: AnyObject {
    func showSuperheroes()
    func showError()
    func showLoading()
    func hideLoading()
    
    func changelbl()
}

class SuperHeroesViewController: UIViewController {
    
    var interactor: InteractorInterface!
    @IBOutlet var lbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        CharactersWorker().fetchCharacters()
//        getList()
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        lbl.text = "Mazen"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
            self.interactor.changelbl()
        })
    }
    
    func getList() {
        interactor?.fetchCharacters()
//        CharactersWorker().fetchCharacters(completion: {model, error in
//            print("here")
//        })
    }
}

extension SuperHeroesViewController: ViewControllerInterface {
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showSuperheroes() {
        
    }
    
    func showError() {
        
    }
    
    func changelbl() {
        self.lbl.text = "2"
    }
}

