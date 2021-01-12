//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Hsin, Tienchi on 2020/12/29.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻", "🎃", "🕷", "🎺", "🌈"]
        let numCards = Int.random(in: 2...5)
        return MemoryGame<String>(numberOfPairsOfCards: numCards) { pairIndex in
            return emojis[pairIndex]
        }// private(set) glass door.
    }
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intenet(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
