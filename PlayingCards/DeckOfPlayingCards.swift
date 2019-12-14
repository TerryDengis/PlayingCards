//
//  DeckOfPlayingCards.swift
//  PlayingCards
//
//  Created by Terry Dengis on 11/15/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import Foundation

struct DeckOfPlayingCards {
    private (set) var deckOfCards = [PlayingCard] ()
    
    init () {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                deckOfCards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    mutating func drawCard () -> PlayingCard? {
        if deckOfCards.count > 0 {
            return deckOfCards.remove(at: Int.random(in: 0 ..< deckOfCards.count))
        } else {
            return nil
        }
    }
}
