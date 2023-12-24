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
    /// State to manage the navigation selection.
    @State private var selection: String? = nil
    
    /// Body of the MainView.
    var body: some View {
        NavigationView {
            VStack {
                Text("NBA Combine: Stats Tracker")
                    .foregroundStyle(Color("NBAWhite"))
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Spacer()
                Image("nbaLogo")
                    .resizable()
                    .scaledToFit()
                Spacer()
                // NavigationLink to transition to the SelectTeamView
                NavigationLink(destination: SelectTeamView(nbaTeam: viewModel.nbaTeam), tag: "A", selection: $selection) {
                    EmptyView()
                }
                // NBAButton to find team stats
                NBAButton(title: "Find Team Stats", action: { selection = "A" })
                // NBAButton to see today's scores
                NBAButton(title: "See Today's Scores", action: {})
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("NBABlue"))
            .onAppear { viewModel.playAudio() }
        }
    }
}

// Preview for the MainView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewViewModel())
    }
}
