//
//  NBAGamesTodayView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

import SwiftUI

struct NBAGamesTodayView: View {
    /// View model for the NBAGamesTodayView.
    @ObservedObject var viewModel: NBAGamesTodayViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.nbaGames.data) { game in
                NBAGameView(viewModel: .init(game: game))
            }
        }
    }
}

#Preview {
    NBAGamesTodayView(viewModel: .init())
}
