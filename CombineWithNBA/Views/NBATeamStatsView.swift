//
//  NBATeamStatsView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 1/3/24.
//

import SwiftUI

struct NBATeamStatsView: View {
    let nbaGames: NBAGames
    var body: some View {
        ScrollView {
            ForEach(nbaGames.data) { game in
                NBAGameView(viewModel: .init(game: game))
                    .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    NBATeamStatsView(nbaGames: .mock())
}
