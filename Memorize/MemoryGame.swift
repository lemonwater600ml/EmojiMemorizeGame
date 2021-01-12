//
//  File.swift
//  Memorize
//
//  Created by Hsin, Tienchi on 2020/12/29.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card) { // because it's a struct
        print("card chosen: \(card)")
        let choosenIndex: Int = index(of: card)
        cards[choosenIndex].isFaceUp = !cards[choosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int {
        for idx in 0..<cards.count {
            if cards[idx].id == card.id {
                return idx
            }
        }
        return 0 // TODO: bogus!
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
         cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
