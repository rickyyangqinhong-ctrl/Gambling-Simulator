//
//  ContentView.swift
//  Gambling simulator
//
//  Created by Rishi on 31/8/26.
//
// no code here is fully made by ai
// not the whole thing
import SwiftUI
class Global {
    static let shared = Global()
    
    // Store Money as a Double. Default is 0.0
    @AppStorage("global_Money_key") var Money: Double = 500.0
}
struct ContentView: View {
    @AppStorage("global_Money_key") var Money: Double = 500.0
    @State private var gambleAmount: Double = 0
    @State private var resultMessage: String = "Roll to see your result!"
    var body: some View {
        NavigationStack{
            TabView{
                Tab("Gamble", systemImage: "die.face.4") {
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
                        
                        Image(systemName: "die.face.5")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .font(.system(size: 100))
                        // type amount to gamble
                        Text("How much do you want to gamble?")
                            .font(.system(size: 22))
                            .padding()
                        TextField("Type something here...", value: $gambleAmount, format: .number)
                            .textFieldStyle(.roundedBorder)
                            .font(.system(size: 30))
                            .padding(.vertical)
                            .padding(.vertical)
                        // Gamble code
                        Button("Gamble 🎲") {
                            if Money < gambleAmount {
                                resultMessage = "You don't have enough Money to gamble!"
                                return
                            }
                            Money -= gambleAmount
                            let multiplier = Double.random(in: -1.0...3.0)
                            let change = (gambleAmount * multiplier).rounded(toPlaces: 2)
                            Money = (Money + change).rounded(toPlaces: 2)
                            let net = (change - gambleAmount).rounded(toPlaces: 2)
                            if net >= 0 {
                                resultMessage = String(format: "You won $%.2f!", net)
                            } else {
                                resultMessage = String(format: "You lost $%.2f!", abs(net))
                            }
                        }
                        .background(Color.blue)
                        .cornerRadius(20)
                        Button(" Reset Balance ") {
                            Money = 500.0
                        }
                        .foregroundColor(.yellow)
                        .font(.system(size: 20, weight: .bold))
                        //Announce
                        Text(resultMessage)
                            .foregroundColor(resultMessage.contains("won") ? .green : .red)
                            .font(.system(size: 30))
                        Text("Money:")
                            .font(.system(size: 30))
                            .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))
                        Text("$\(String(format: "%.2f", Money))💰")
                            .font(.system(size: 40))
                            .foregroundStyle(Color(red: 0.95, green: 0.77, blue: 0.06))
                        Spacer()
                    }
                    .font(Font.system(size: 50))
                    .foregroundStyle(Color.red)
                }
                Tab("Yahtzee", systemImage: "gamecontroller"){
                    YahtzeeGM()
                }
                Tab("Slots", systemImage: "7.calendar"){
                    SlotsGM()
                }
            }
            .padding()
        }
    }

        }
extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
#Preview {
    ContentView()
}
