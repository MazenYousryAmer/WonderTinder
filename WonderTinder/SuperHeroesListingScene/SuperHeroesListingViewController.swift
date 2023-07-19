//
//  SuperHeroesListingViewController.swift
//  WonderTinder
//
//  Created by Mazen Amer on 16/07/2023.
//

import UIKit


protocol ListingDisplayInterface: AnyObject {
    func displaySuperHeroes(heroes: [WonderSuperHeroModel])
    func displayEmptyView()
}

class SuperHeroesListingViewController: UIViewController {
    
    @IBOutlet var tableHeroes: UITableView!
    @IBOutlet var errorLabel: UILabel!
    var interactor: ListingInteractorInterface!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getHeroesList()
    }
    
    func getHeroesList() {
        interactor.listHeroes()
    }
}

extension SuperHeroesListingViewController: ListingDisplayInterface {
    func displaySuperHeroes(heroes: [WonderSuperHeroModel]) {
        interactor.setShowedSuperHeroes(heroes: heroes)
        self.tableHeroes.isHidden = false
        errorLabel.isHidden = true
        tableHeroes.reloadData()
    }
    
    func displayEmptyView() {
        self.tableHeroes.isHidden = true
        errorLabel.isHidden = false
    }
}

extension SuperHeroesListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor.getShowedSuperHeroes().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuperHeroTableViewCell") as! SuperHeroTableViewCell
        cell.configureCell(superHero: interactor.getSuperHero(index: indexPath.row))
        return cell
    }
}

extension SuperHeroesListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
}
