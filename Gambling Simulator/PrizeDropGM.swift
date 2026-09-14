//
//  PrizeDropGM.swift
//  Gambling simulator
//
//  Created by Ricky   Yang on 2/9/26.
//

import SwiftUI

struct PrizeDropGM: View {
    @State private var strikes: Int = 0
    @State private var degrees: Double = 0
    @State private var rank: String = "Common"
    @State private var rankColor: Color = .gray
    @State private var isButtonVisible = false
    @State private var announce: String = "Open to see"
    @AppStorage("global_Money_key") var Money: Double = 500.0
    
    var body: some View {
        VStack {
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
            
            Text("Prize")
                .font(.system(size: 35))
            
            Text("\(rank)")
                .font(.system(size: 35))
                .bold()
                .foregroundStyle(rankColor)
            
            Spacer()
            
            if !isButtonVisible {
                if Money < 100 {
                } else {
                    Button("Click to Reveal $100") {
                        Money -= 100
                        withAnimation(.spring()) {
                            isButtonVisible = true
                        }
                    }
                    .font(.title2).bold()
                    .buttonStyle(.borderedProminent)
                }
            }

            if isButtonVisible {
                Button(action: {
                    strikes += 1

                    withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                        degrees += Bool.random() ? 25 : -25

                        if Bool.random() && strikes < 4 {
                            upgradeRank()
                        }
                    }

                    if strikes == 4 {
                        if rank == "Common" {
                            Money += 10
                            announce = "You received $10"
                        } else if rank == "Rare" {
                            Money += 30
                            announce = "You received $100"
                        } else if rank == "Epic" {
                            Money += 110
                            announce = "You received $300"
                        } else if rank == "Mythic" {
                            Money += 200
                            announce = "You received $500"
                        } else if rank == "Legendary" {
                            announce = "You received $1000"
                            Money += 500
                        }
                        
                        rank = "🎉 OPENED \(rank)!"
                        degrees = 0
                    }

                    if strikes > 4 {
                        resetGame()
                    }
                }) {
                    Text("🎁")
                        .font(.system(size: 100))
                        .rotationEffect(.degrees(degrees))
                }
            }
            Text(announce)
                .font(.system(size: 30))
            Button(" Reset Balance ") {
                Money = 500.0
            }
            .foregroundColor(.yellow)
            .font(.system(size: 20, weight: .bold))
            .padding(0.1)
            Text("Money:")
                .font(.system(size: 30))
                .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))
            Text("$\(String(format: "%.2f", Money))💰")
                .font(.system(size: 40))
                .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))
            
            Spacer()
            
            HStack(spacing: 20) {
                Image(systemName: "cursorarrow.click")
                    .rotationEffect(.degrees(45))
                    .foregroundColor(strikes >= 1 ? .blue : .gray)
                
                Image(systemName: "cursorarrow.click")
                    .rotationEffect(.degrees(45))
                    .foregroundColor(strikes >= 2 ? .blue : .gray)
                
                Image(systemName: "cursorarrow.click")
                    .rotationEffect(.degrees(45))
                    .foregroundColor(strikes >= 3 ? .blue : .gray)
                
                Image(systemName: "cursorarrow.click")
                    .rotationEffect(.degrees(45))
                    .foregroundColor(strikes >= 4 ? .green : .gray)
            }
            .font(.system(size: 35))
            .padding(.bottom, 40)
        }
    }
    
    func upgradeRank() {
        if rank == "Common" { rank = "Rare"; rankColor = .blue }
        else if rank == "Rare" { rank = "Epic"; rankColor = .purple }
        else if rank == "Epic" { rank = "Mythic"; rankColor = .red }
        else if rank == "Mythic" { rank = "Legendary"; rankColor = .orange }
    }
    
    func resetGame() {
        strikes = 0
        degrees = 0
        rank = "Common"
        rankColor = .gray
        withAnimation(.spring()) {
            isButtonVisible = false
        }
    }
}

#Preview {
    PrizeDropGM()
}
