//
//  SlotsGM.swift
//  Gambling simulator
//
//  Created by Ricky   Yang on 2/9/26.
//

import SwiftUI
import Foundation
struct SlotsGM: View {
    @AppStorage("global_Money_key") var Money: Double = 500.0
    @State private var slot1num = 0
    @State private var slot2num = 0
    @State private var slot3num = 0
    @State private var slot1 = "🍒"
    @State private var slot2 = "🍒"
    @State private var slot3 = "🍒"
    @State private var announce = "Spin to see your result!"
    let symbols = ["🍒", "🍋", "🍉", "🛎️", "💎", "7️⃣"]
    func calculatePayout() {
        if slot1 == "7️⃣" && slot2 == "7️⃣" && slot3 == "7️⃣"{
            announce = "7 Jackpot! +$1000"
            Money+=1000
            return
        } else if slot1 == slot2 && slot2 == slot3  {
            announce = "Jackpot! All 3 match! +$100"
            Money+=100
            return
        } else if slot1 == slot2 || slot2 == slot3 || slot1 == slot3 {
            announce = "Mini win! 2 match! +$50"
            Money+=50
            return
        }else {
            announce = "No match. Try again!"
        }
    }
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
                Text("Slots Gamble🎰")
                    .font(.system(size: 55))
                    .foregroundStyle(Color.red)
                HStack{
                    Text(slot1)
                        .font(.system(size: 67))
                    Text(slot2)
                        .font(.system(size: 67))
                    Text(slot3)
                        .font(.system(size: 67))
                }
                .padding(45)
                Text(announce)
                    .foregroundStyle(Color.red)
                    .font(.system(size: 40))
                Button("Spin slots ($20)") {
                    var rollCount = 0
                    let totalRolls = 10
                    if Money < 20{
                        announce = "You don't have enough to gamble"
                    } else{
                        Money -= 20
                        Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
                            rollCount += 1
                            
                            withAnimation(.linear(duration: 0.08)) {
                                // --- ROLL REEL 1 ---
                                slot1num = Int.random(in: 0...6)
                                if slot1num == 0 { slot1 = "🍒" }
                                else if slot1num == 1 { slot1 = "🍒" }
                                else if slot1num == 2 { slot1 = "🍋" }
                                else if slot1num == 3 { slot1 = "🍉" }
                                else if slot1num == 4 { slot1 = "🛎️" }
                                else if slot1num == 5 { slot1 = "💎" }
                                else if slot1num == 6 { slot1 = "7️⃣" }
                                
                                // --- ROLL REEL 2 ---
                                slot2num = Int.random(in: 0...6)
                                if slot2num == 0 { slot2 = "🍒" }
                                else if slot2num == 1 { slot2 = "🍒" }
                                else if slot2num == 2 { slot2 = "🍋" }
                                else if slot2num == 3 { slot2 = "🍉" }
                                else if slot2num == 4 { slot2 = "🛎️" }
                                else if slot2num == 5 { slot2 = "💎" }
                                else if slot2num == 6 { slot2 = "7️⃣" }
                                
                                // --- ROLL REEL 3 ---
                                slot3num = Int.random(in: 0...6)
                                if slot3num == 0 { slot3 = "🍒" }
                                else if slot3num == 1 { slot3 = "🍒" }
                                else if slot3num == 2 { slot3 = "🍋" }
                                else if slot3num == 3 { slot3 = "🍉" }
                                else if slot3num == 4 { slot3 = "🛎️" }
                                else if slot3num == 5 { slot3 = "💎" }
                                else if slot3num == 6 { slot3 = "7️⃣" }
                            }
                            
                            if rollCount >= totalRolls {
                                timer.invalidate()
                                
                                // --- CALCULATE WIN CONDITIONS ---
                                calculatePayout()
                            }
                        }
                    }
                }
                .font(.system(size: 50))
                .background(Color.red)
                .cornerRadius(20)
                Button(" Reset Balance ") {
                    // Simply change Money directly. It updates everywhere instantly!
                    Money = 500.0
                }
                .foregroundColor(.yellow)
                .font(.system(size: 20, weight: .bold))
                Text("Money:")
                    .font(.system(size: 30))
                    .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))
                Text("$\(String(format: "%.2f", Money))💰")
                    .font(.system(size: 40))
                    .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))




                }
            Spacer()
            }
            }
        }

#Preview {
    SlotsGM()
}
