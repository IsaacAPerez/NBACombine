
//
//  SelectTeamView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/23/23.
//

import SwiftUI

/// A view for selecting an NBA team.
struct SelectTeamView: View {
    @StateObject var viewModel: SelectTeamViewModel
    
    /// The body of the SelectTeamView.
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(viewModel.nbaTeam.data) { team in
                    TeamCardView(nbaTeam: team, onDidTap: { id in
                        viewModel.fetchWeekSchedule(for: id)
                    })
                }
            }
        }
        .sheet(isPresented: $viewModel.showingTeam) {
            NBATeamStatsView(nbaGames: viewModel.nbaGames!)
        }
        .padding()
        .background(Color("NBABlue"))
        .navigationBarTitle("Select NBA Team", displayMode: .inline)
    }
}

//#Preview {
//    return SelectTeamView(viewModel: .init(nbaTeam: .mock()))
//}
