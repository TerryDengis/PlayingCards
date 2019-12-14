//
//  ViewController.swift
//  PlayingCards
//
//  Created by Terry Dengis on 11/15/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var deckOfCards: UIImageView!
    
    var theDeck = DeckOfPlayingCards ()
    var animationManager : AnimationHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTapGesture = UITapGestureRecognizer (target: self, action: #selector (tapDeck))
        myTapGesture.numberOfTapsRequired = 1
        deckOfCards.addGestureRecognizer(myTapGesture)
        deckOfCards.isUserInteractionEnabled = true
        deckOfCards.layer.cornerRadius = 8
        UIView.animate(withDuration: 0.5) {
            let height = (UIScreen.main.bounds.height - 180) / 5
            let width = height / 1.5
            let yLocation = (UIScreen.main.bounds.height - height - 50)
        
            self.deckOfCards.frame = CGRect (x: 20, y: yLocation, width: width, height: height)
        }
        animationManager = AnimationHelper (fromFrame: deckOfCards.frame)
    }

    @objc func tapDeck () {

        let card = theDeck.drawCard()
        if let cardName = card?.description {
            animateNewCard (with: cardName)
        } else {
            print ("Couldn't get the card name")
        }
        if theDeck.deckOfCards.count == 0 {
            deckOfCards.isHidden = true
            deckOfCards.isUserInteractionEnabled = false
        }
    }
    func animateNewCard (with cardName: String) {
        let theCardView = UIImageView (frame: animationManager.originFrame)
        
        theCardView.layer.cornerRadius = 8
        theCardView.image = UIImage (named: cardName)
        theCardView.contentMode = .scaleAspectFit
        theCardView.clipsToBounds = true
        self.view.addSubview(theCardView)
        UIView.animate(withDuration: 0.5) {
            theCardView.frame = self.animationManager.nextFrame ()
        }
    }
}

