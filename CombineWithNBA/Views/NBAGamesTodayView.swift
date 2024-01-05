//
//  NBAGamesTodayView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

import SwiftUI

struct NBAGamesTodayView: View {
    /// View model for the NBAGamesTodayView.
    @StateObject var viewModel: NBAGamesTodayViewModel
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.nbaGames.data) { game in
                NBAGameView(viewModel: .init(game: game))
                    .padding(.horizontal, 16)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("NBABlue"))
        .navigationBarTitle("NBA Games Today", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {viewModel.fetchNBAGames()}, label: {
                    Image(systemName: "arrow.clockwise")
                        .resizable()
                        .foregroundColor(Color("NBARed"))
                })
            }
        }
    }
}

#Preview {
    NBAGamesTodayView(viewModel: .init())
}
