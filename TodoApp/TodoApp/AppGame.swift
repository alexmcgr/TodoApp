//
//  AppGame.swift
//  TodoApp
//
//  Created by Alex McGregor on 8/8/20.
//  Copyright © 2020 Alex McGregor. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) {
        print("Card Chosen: \(card)")
        let index = self.index(of: card)
        self.cards[index].isFront = !self.cards[index].isFront
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return self.cards[index].id
            }
        }
        return -1
    }
    
    init(numberOfPairs: Int, CardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairs {
            let content = CardContentFactory(pairIndex)
            cards.append(Card(symbol: content, id: pairIndex * 2))
            cards.append(Card(symbol: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFront: Bool = true
        var symbol: CardContent
        var isMatched: Bool = false
        var id: Int
    }
}

