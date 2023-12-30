//
//  MainView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/22/23.
//

import SwiftUI

/// The main view of the app.
struct MainView: View {
    /// View model for the MainView.
    @ObservedObject var viewModel: MainViewViewModel
    @State private var path: [Screen] = []
    
    enum Screen: Codable {
        case teamStats
        case todaysGame
    }
    
    /// Body of the MainView.
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("NBA Combine: Stats Tracker")
                    .foregroundStyle(Color("NBAWhite"))
                    .font(.custom("NBA Lakers", size: 50))
                    .multilineTextAlignment(.center)
                Spacer()
                Image("nbaLogo")
                    .resizable()
                    .scaledToFit()
                Image(systemName: viewModel.musicButtonName)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color("NBARed"))
                    .onTapGesture {
                        viewModel.isAudioPlaying.toggle()
                    }
                Spacer()
                NBAButton(title: "See Today's Scores", action: { path.append(.todaysGame) })
                NBAButton(title: "Find Team Stats",action: { path.append(.teamStats) })
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("NBABlue"))
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .teamStats:
                    SelectTeamView(nbaTeam: viewModel.nbaTeam)
                case .todaysGame:
                    NBAGamesTodayView(viewModel: .init())
                }
            }
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(Color("NBABlue"))
            
            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

// Preview for the MainView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewViewModel())
    }
}
