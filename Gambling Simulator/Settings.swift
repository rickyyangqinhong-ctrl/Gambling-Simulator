//
//  Settings.swift
//  Gambling simulator
//
//  Created by Ricky   Yang on 2/9/26.
//

import SwiftUI
struct Settings: View {
    @AppStorage("appTheme") private var selectedTheme = "System"
    let themes = ["Light", "Dark", "System"]
    
    @AppStorage("global_Money_key") var money: Double = 500.0
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Theme")
                    Spacer()
                    
                    Menu {
                        ForEach(themes, id: \.self) { theme in
                            Button(theme) {
                                selectedTheme = theme
                            }
                        }
                    } label: {
                        HStack(spacing: 4) {
                            Text(selectedTheme)
                                .foregroundColor(.secondary)
                            Image(systemName: "chevron.up.chevron.down")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .navigationTitle("Settings")
            .preferredColorScheme(getColorScheme())
        }
    }
    
    private func getColorScheme() -> ColorScheme? {
        switch selectedTheme {
        case "Light": return .light
        case "Dark": return .dark
        default: return nil
        }
    }
}

#Preview {
    Settings()
}
