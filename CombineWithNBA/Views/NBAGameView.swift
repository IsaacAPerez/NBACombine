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
                HStack(spacing: 50) {
                    VStack(alignment: .center, spacing: 10) {
                        Text("Home Team")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(viewModel.homeTeam)
                        Text(viewModel.homeScore)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    VStack {
                        Text(viewModel.time)
                        Text(viewModel.quarter)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Away Team")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text(viewModel.awayTeam)
                        Text(viewModel.awayScore)
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("NBARed"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
        }
}

#Preview {
    NBAGameView(viewModel: .init(game: .mock()))
}
