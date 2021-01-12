 //
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Hsin, Tienchi on 2020/12/17.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        let fontSize = viewModel.cards.count == 5 ? Font.title : Font.largeTitle
        HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(fontSize)
        

    }
}
  
 struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(0.7, contentMode: .fit)
    }
 }
 
 
 
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
