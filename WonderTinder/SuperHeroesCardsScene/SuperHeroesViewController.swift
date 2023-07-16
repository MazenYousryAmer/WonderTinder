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
    var viewModel: WonderSuperHeroViewModel?
    
    @IBOutlet var errorLabel: UILabel!
    @IBOutlet weak var cardContainerView: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        CharactersWorker().fetchCharacters()
        showLoading()
        
//        hideError()
        interactor.fetchCharacters()
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
//    func getList() {
//        interactor?.fetchCharacters()
////        CharactersWorker().fetchCharacters(completion: {model, error in
////            print("here")
////        })
//    }
    
    
    func createCards() {
//        for superheroCharater in viewModel!.allSuperheroCharaters {
//            let card = SuperHeroCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
//            card.configureCard(model: superheroCharater)
//
////            let pan = UIPanGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
////            tap.delegate = self
////            card.addGestureRecognizer(pan)
//            cardContainerView.addSubview(card)
////            cardContainerView.vi
//
//        }
        
        for i in (1..<viewModel!.allSuperheroCharaters.count) {
            let superheroCharater = viewModel!.allSuperheroCharaters[i]
            let card = SuperHeroCardView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            card.tag = i
            card.delegate = self
            card.configureCard(model: superheroCharater)
            cardContainerView.addSubview(card)
        }
    }
    
    
//    @objc func handleTap(_ sender: UIPanGestureRecognizer) {
//        let card = sender.view!
//        let point = sender.translation(in: view)
//        print(point)
//        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y - (cardContainerView.frame.height / 2) )
//    }
    
}

extension SuperHeroesViewController: ViewControllerDisplayInterface {
    func showEmptyView() {
        errorLabel.isHidden = false
        errorLabel.text = "No cards!"
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
        interactor.storeViewModel(viewModel: viewModel)
        self.viewModel = viewModel
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
    }
    
    
}



