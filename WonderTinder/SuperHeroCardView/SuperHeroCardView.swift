//
//  SuperHeroCardUIView.swift
//  WonderTinder
//
//  Created by Mazen Amer on 15/07/2023.
//

import UIKit

protocol SuperHeroCarViewDelegate: AnyObject {
    func likeSuperHero(shouldLike: Bool, for: SuperHeroCardView)
}

class SuperHeroCardView: UIView {
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var charImageView: UIImageView!
    @IBOutlet var charNameLabel: UILabel!
    @IBOutlet var likeLabel: UILabel!
    @IBOutlet var dislikeLabel: UILabel!
    @IBOutlet var labelHolderView: UIView!
    
    var cardCenter = CGPoint()
    var superHeroCharacter: WonderSuperHeroModel!
    weak var delegate: SuperHeroCarViewDelegate!
    private var margin = CGFloat(0.7)
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let view = Bundle.main.loadNibNamed("SuperHeroCardView", owner: self, options: nil)?.first as! UIView
        labelHolderView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.addSubview(view);
    }
    
    func configureCard(model: WonderSuperHeroModel) {
        self.superHeroCharacter = model
        charNameLabel.text = model.name
        cardCenter = self.center

        guard let url = URL(string: model.url ?? "") else {
            return
        }
        charImageView.downloadImage(from: url)
    }
    
    private func animateLike(xPos: CGFloat) {
        likeLabel.alpha = xPos / cardCenter.x
        dislikeLabel.alpha = 0.0
    }
    
    private func animateDislike(xPos: CGFloat) {
        likeLabel.alpha = 0.0
        dislikeLabel.alpha = abs(xPos / cardCenter.x)
    }
    
    private func makeNeutral() {
        likeLabel.alpha = 0.0
        dislikeLabel.alpha = 0.0
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let point = sender.translation(in: self.superview)
        self.center = CGPoint(x: cardCenter.x + point.x, y: cardCenter.y + point.y)
        point.x > 0 ? animateLike(xPos: point.x): animateDislike(xPos: point.x)

        if sender.state == .ended {
            if (point.x / cardCenter.x) > margin {
                UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                    self.center = CGPoint(x: self.center.x + UIScreen.main.bounds.width, y: self.center.y)
                }) { _ in
                    self.delegate.likeSuperHero(shouldLike: true, for: self)
                }
                return
            } else if (point.x / cardCenter.x) < margin * -1 {
                UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                    self.center = CGPoint(x: self.center.x - UIScreen.main.bounds.width, y: self.center.y)
                }) { _ in
                    self.delegate.likeSuperHero(shouldLike: false, for: self)
                }
                return
            } else {
                self.makeNeutral()
            }
            
            UIView.animate(withDuration: 0.2, delay: 0.0, animations: {
                self.center = self.cardCenter
            })
        }
    }
}
