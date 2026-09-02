//
//  IntroView.swift
//  Gambling simulator
//
//  Created by Rishi on 1/9/26.
//

import SwiftUI

struct IntroView: View {
    @State var scale = 1.0
    @State var rotate = 0.0
    @State private var showLaunch: Bool = false
    
    var body: some View {
            VStack(spacing: 24){
                Text("Welcome")
                    .font(.system(size: 100))
                Image(systemName: "die.face.5")
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .font(.largeTitle)
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 1), value: scale)
                Text("WARM WELCOME TO GAMBLING SIMULATOR")
                Text("Time to  put your money")
                Button{
                    showLaunch = true
                } label: {
                    Text("So Lock In 🔏")
                        .foregroundColor(.green)
                }
            }
            .onAppear {
                scale = 1.5
        }
            .fullScreenCover(isPresented: $showLaunch) {
                ContentView()
            }
    }
}

#Preview {
    IntroView()
}
