//
//  PlayingCard.swift
//  PlayingCards
//
//  Created by Terry Dengis on 11/15/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import Foundation

struct PlayingCard {
    enum Suit: String {
        
        case spades = "♠️"
        case hearts = "♥️"
        case diamonds = "♦️"
        case clubs = "♣️"
        
        static var all = [Suit.spades, .hearts, .diamonds, .clubs]
    }
    enum Rank {
        case ace
        case face(String)
        case numeric(Int)
        
        var order: Int {
            switch(self) {
            case .ace: return 1
            case .numeric(let pips): return pips
            case .face(let kind) where kind == "jack": return 11
            case .face(let kind) where kind == "queen": return 12
            case .face(let kind) where kind == "king": return 13
            default: return 0
            }
        }
        var textValue: String {
            switch(self) {
            case .ace: return "ace"
            case .numeric(let pips): return "\(pips)"
            case .face(let kind) where kind == "jack": return "jack"
            case .face(let kind) where kind == "queen": return "queen"
            case .face(let kind) where kind == "king": return "king"
            default: return ""
            }
        }
        static var all: [Rank]{
            var allRanks: [Rank] = [.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numeric(pips))
            }
            allRanks += [Rank.face("jack"), Rank.face("queen"), Rank.face("king")]
            return allRanks
        }
    }
    
    var suit: Suit
    var rank: Rank
    var description: String {return "\(rank.textValue)_of_\(suit)"}
}
