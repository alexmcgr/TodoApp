//
//  ContentView.swift
//  TodoGoals
//
//  Created by Alex McGregor on 8/7/20.
//  Copyright © 2020 Alex McGregor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    
    var body: some View {
        return HStack {
            ForEach(self.viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        .padding()
        .foregroundColor(Color.blue)
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFront {
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeWidth)
                Text(card.symbol)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    
    // MARK: - Drawing Constants
    let cornerRadius: CGFloat = 10.0
    let strokeWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}

struct Home: View {

    var body: some View {
        NavigationView {
            
            VStack {
                Text("")
                Divider()
                Spacer()
            }
            .navigationBarTitle("\(getDate())")
            .background(Color.black.opacity(0.06)).edgesIgnoringSafeArea(.bottom)
        }
    }
}

func getDate() -> String {
    let date = Date()
    let calendar = Calendar.current

    let day = calendar.component(.day, from: date)
    let daySuffix: String
    switch day {
    case 11...13: daySuffix = "th"
    default:
        switch day % 10 {
        case 1: daySuffix = "st"
        case 2: daySuffix = "nd"
        case 3: daySuffix = "rd"
        default: daySuffix = "th"
        }
    }

    let timeFormatter = DateFormatter()
    timeFormatter.dateFormat = "EEEE, MMM d'\(daySuffix)'"
    return timeFormatter.string(from: date)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
//        ContentView(viewModel: EmojiMemoryGame())
    }
}
