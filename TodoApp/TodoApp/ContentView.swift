//
//  ContentView.swift
//  TodoGoals
//
//  Created by Alex McGregor on 8/7/20.
//  Copyright © 2020 Alex McGregor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<4) { index in
                VStack {
                    ForEach(0..<5) { ind in
                        Picker(index: ind)
                    }
                }
            }
        }
        .padding()
        .foregroundColor(Color.blue)
    }
}

struct CardView: View {
    var isFaceUp: Bool
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)
                Circle().fill()
                Text("🙂").font(Font.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct Picker: View {
    var index: Int
    var body: some View {
        CardView(isFaceUp: index % 2 == 0)
    }
}

