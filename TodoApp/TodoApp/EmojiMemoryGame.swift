//
//  EmojiMemoryGame.swift
//  TodoApp
//
//  Created by Alex McGregor on 8/8/20.
//  Copyright © 2020 Alex McGregor. All rights reserved.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var game: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["✊", "👀", "😂", "🙏"]
        return MemoryGame<String>(numberOfPairs: 4) { pairIndex in
            return emojis[pairIndex] }
    }

    // MARK: Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        game.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        game.choose(card: card)
    }
}
