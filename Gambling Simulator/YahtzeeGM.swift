//
//  YahtzeeGM.swift
//  Gambling simulator
//
//  Created by Ricky   Yang on 1/9/26.
//

import SwiftUI
struct YahtzeeGM: View {
    @State private var dice1: Int = 1
    @State private var dice2: Int = 1
    @State private var dice3: Int = 1
    @State private var dice4: Int = 1
    @State private var dice5: Int = 1
    @State private var resultMessage: String = "Roll to see your result!"
    @State private var resultMessage2: String = "Roll to see your result!"
    @State private var resultMessage3: String = "Roll to see your result!"
    @State private var resultMessage4: String = "Roll to see your result!"
    func calculateScore(for category: String) -> Int {
        let hand = [dice1, dice2, dice3, dice4, dice5].sorted()
        
        switch category {
            
        case "TwoOfAKind":
            if (hand[0] == hand[1]) || (hand[1] == hand[2]) || (hand[2] == hand[3]) || (hand[3] == hand[4]) {
                return hand.reduce(0, +)
            }
            return 0
            
        case "ThreeOfAKind":
            if (hand[0] == hand[2]) || (hand[1] == hand[3]) || (hand[2] == hand[4]) {
                return hand.reduce(0, +) 
            }
            return 0
            
        case "FullHouse":
            let pattern1 = (hand[0] == hand[1] && hand[1] == hand[2] && hand[3] == hand[4])
            let pattern2 = (hand[0] == hand[1] && hand[2] == hand[3] && hand[3] == hand[4])
            if pattern1 || pattern2 {
                return 25
            }
            return 0
            
        case "LargeStraight":
            if hand == [1, 2, 3, 4, 5] || hand == [2, 3, 4, 5, 6] {
                return 40
            }
            return 0
            
        case "Yahtzee":
            if hand[0] == hand[4] {
                return 50
            }
            return 0
            
        default:
            return 0
        }
    }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack{
            VStack{
                HStack {
                    Spacer()
                    NavigationLink {
                        How_to_Play()
                    } label: {
                        Text("\(Image(systemName: "questionmark.circle.fill"))")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                    }
                }
                .padding(.horizontal)
                Text("Yahtzee")
                    .font(.system(size: 100))
                    .foregroundStyle(Color.red)
                HStack{
                    Image(systemName: "die.face.\(dice1)")
                        .font(.system(size: 100))
                        .animation(.easeInOut(duration: 0.3), value: dice1)
                    Image(systemName: "die.face.\(dice2)")
                        .font(.system(size: 100))
                        .animation(.easeInOut(duration: 0.3), value: dice2)
                    Image(systemName: "die.face.\(dice3)")
                        .font(.system(size: 100))
                        .animation(.easeInOut(duration: 0.3), value: dice3)
                }
                HStack{
                        Image(systemName: "die.face.\(dice4)")
                            .font(.system(size: 100))
                            .animation(.easeInOut(duration: 0.3), value: dice4)
                        Image(systemName: "die.face.\(dice5)")
                            .font(.system(size: 100))
                            .animation(.easeInOut(duration: 0.3), value: dice5)
                    }
                Button(" Roll Dice "){
                    dice1 = Int.random(in: 1...6)
                    dice2 = Int.random(in: 1...6)
                    dice3 = Int.random(in: 1...6)
                    dice4 = Int.random(in: 1...6)
                    dice5 = Int.random(in: 1...6)
                    resultMessage = "Two of a Kind points: \(calculateScore(for: "TwoOfAKind"))"
                    resultMessage2 = "Three of a Kind points: \(calculateScore(for: "ThreeOfAKind"))"
                    resultMessage3 = "Full House points: \(calculateScore(for: "FullHouse"))"
                    resultMessage4 = "Yahtzee points: \(calculateScore(for: "Yahtzee"))"
            }
                .background(Color.red)
                .cornerRadius(20)
                .font(Font.system(size: 50))
                Text(resultMessage)
                    .foregroundStyle(Color.red)
                    .font(.system(size: 30))
                Text(resultMessage2)
                    .foregroundStyle(Color.red)
                    .font(.system(size: 30))
                Text(resultMessage3)
                    .foregroundStyle(Color.red)
                    .font(.system(size: 30))
                Text(resultMessage4)
                    .foregroundStyle(Color.red)
                    .font(.system(size: 30))
            Spacer()
            }
        }
    }
}

#Preview {
    YahtzeeGM()
}
