//
//  NBAGameView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

import SwiftUI

struct NBAGameView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Lakers vs Clippers")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }

            Divider()

            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Home Team: Lakers")
                    Text("Away Team: Clippers")
                    Text("Status: In progress")
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 10) {
                    Text("Home Score: 50")
                    Text("Away Score: 50")
                    Text("Time: 7:30")
                    Text("Quarter: 2nd")
                }
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Game Details", displayMode: .inline)
    }
}

#Preview {
    NBAGameView()
}
