//
//  ViewController.swift
//  WonderTinder
//
//  Created by Mazen Amer on 14/07/2023.
//

import UIKit

protocol ViewControllerDisplayInterface: AnyObject {
    func showSuperheroes(viewModel: WonderSuperHeroViewModel)
    func showError()
    func hideError()
    func showLoading()
    func hideLoading()
    func showEmptyView()
}

class SuperHeroesViewController: UIViewController {
    
    var interactor: InteractorInterface!
//    var viewModel: WonderSuperHeroViewModel?
    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardContainerView.layer.cornerRadius = 5.0
        showLoading()
        interactor.fetchCharacters()
    }
    
    func createCards() {
        let viewModel = interactor.getSuperHeroesViewModel()
        for i in (1..<viewModel.allSuperheroCharaters.count) {
            let superheroCharater = viewModel.allSuperheroCharaters[i]
            let card = SuperHeroCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            card.tag = i
            card.delegate = self
            card.configureCard(model: superheroCharater)
            cardContainerView.addSubview(card)
        }
    }
}

extension SuperHeroesViewController: ViewControllerDisplayInterface {
    func showEmptyView() {
        cardContainerView.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = "No more cards!"
    }
    
    func showLoading() {
        cardContainerView.isHidden = true
        loadingIndicator.isHidden = false
    }
    
    func hideLoading() {
        cardContainerView.isHidden = false
        loadingIndicator.isHidden = true
    }
    
    func showSuperheroes(viewModel: WonderSuperHeroViewModel) {
        hideLoading()
        interactor.setSuperHeroesViewModel(viewModel: viewModel)
        createCards()
    }
    
    func showError() {
        hideLoading()
        cardContainerView.isHidden = true
        errorLabel.isHidden = false
        errorLabel.text = "Sorry, couldn't load data."
    }
    
    func hideError() {
        errorLabel.isHidden = true
    }
}

extension SuperHeroesViewController: SuperHeroCarViewDelegate {
    func likeSuperHero(shouldLike: Bool, for card: SuperHeroCardView) {
        interactor.setIsLiked(shouldLike, for: card)
        cardContainerView.viewWithTag(card.tag)?.removeFromSuperview()
        if cardContainerView.subviews.count == 0 {
            showEmptyView()
        }
    }
}



