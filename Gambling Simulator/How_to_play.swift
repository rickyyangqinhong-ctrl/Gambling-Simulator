//
//  How to Play.swift
//  Gambling simulator
//
//  Created by Ricky   Yang on 1/9/26.
//

import SwiftUI

struct How_to_Play: View {
    var body: some View {
        ScrollView{
            Text("How to Play")
                .font(.system(size: 60))
                .padding(20)
            Text("""
            📖 HOW TO PLAY

            🪙 Mode 1: Original Betting
            The classic risk-and-reward gamble.
            1. 💵 Place Your Bet: Enter the amount of virtual coins you want to gamble.
            2. 🎲 Take the Risk: Roll the dice or spin to test your luck.
            3. 🏆 Win or Lose: If you win, you multiply your bet! If you lose, the house takes your coins. Try to build the ultimate bankroll!
            
            ------------------------------------
            
            🎲 Mode 2: Yahtzee
            Think of it as poker, but played with 5 dice instead of cards!
            1. 🔄 Roll: You roll all 5 dice to start your turn.
            2. 📌 Hold: Tap the dice you want to keep (like keeping a good poker hand).
            3. ⚡ Re-Roll: You can re-roll the remaining dice up to 2 more times to fix your hand.
            4. 📝 Score: Pick an open category on your scorecard (like Full House, Straight, or 3-of-a-Kind) to lock in your points.
            5. 🥇 The Goal: Fill all 13 score boxes to finish the game and try to beat your personal high score!
            
            ------------------------------------
            
            🎰 Mode 3: Slots Gamble
            Think of it as a traditional casino machine, but built entirely in code!
            1. 🔄 Bet: Decide on your stake amount before spinning the reels (default is $10).
            2. ⚡ Spin: Tap the "Spin slots" button to initiate a high-speed reel shuffle.
            3. 🌀 The Roll: Watch the columns rapidly scroll past like a real mechanical casino cylinder.
            4. 📝 Calculate: Wait for the reels to stagger-stop one by one to automatically process your scoring.
            5. 🥇 The Goal: Match 2 symbols for a mini-payout, line up all 3 matching symbols to hit the ultimate Jackpot, and try to grow your bankroll as high as possible!
            
            ------------------------------------

            🎁 Mode 4: Prize Drop
            An exciting progression drop inspired by your favorite reward boxes! 
            1. 🎟️ Claim: Tap to open your mystery Prize Drop box.
            2. ⚡ Tap to Upgrade: Tap the screen rapidly! Every tap gives a random chance to upgrade the drop's rarity tier.
            3. 🌀 Rarity Tiers: Watch it evolve through Rare, Super Rare, Epic, Mythic, and Legendary statuses.
            4. 📝 Collect: The higher the rarity tier you reach before it finally bursts open, the bigger the virtual coin payout.
            5. 🥇 The Goal: Chase the ultimate Legendary drop to secure massive casino bonuses and multiply your fortune!
            """)

                .font(Font.system(size: 25))
        }
    }
}

#Preview {
    How_to_Play()
}
