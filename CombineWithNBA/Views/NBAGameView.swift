//
//  NBAGameView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

import SwiftUI

struct NBAGameView: View {
    @StateObject var viewModel: NBAGameViewModel

        var body: some View {
            VStack {
                HStack {
                    Text("\(viewModel.homeTeam) vs \(viewModel.awayTeam)")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }

                Divider()

                HStack {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Home Team: \(viewModel.homeTeam)")
                        Text("Away Team: \(viewModel.awayTeam)")
                        Text("Status: \(viewModel.status)")
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 10) {
                        Text("Home Score: \(viewModel.homeScore)")
                        Text("Away Score: \(viewModel.awayScore)")
                        Text("Time: \(viewModel.time)")
                        Text("Quarter: \(viewModel.quarter)")
                    }
                }

                Spacer()
            }
            .padding()
            .navigationBarTitle("Game Details", displayMode: .inline)
        }
}

#Preview {
    NBAGameView(viewModel: .init(game: .mock()))
}
