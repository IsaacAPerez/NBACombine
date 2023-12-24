//
//  TeamCardView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/23/23.
//

import SwiftUI

/// A view representing a card for displaying NBA team information.
struct TeamCardView: View {
    /// The NBA team to display.
    let nbaTeam: NBATeam
    
    /// The body of the TeamCardView.
    var body: some View {
        VStack {
            Text(nbaTeam.name)
            Text(nbaTeam.city)
            Text(nbaTeam.conference)
            NBAButton(title: "Tap", action: {})
                .backgroundColor(.black)
                .textColor(.white)
        }
        .padding()
        .background(Color("NBARed"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

// Preview for the TeamCardView
struct TeamCardView_Previews: PreviewProvider {
    static var previews: some View {
        TeamCardView(nbaTeam: .init(id: 1, abbreviation: "LAL", city: "Los Angeles", conference: "Western", division: "Pacific", full_name: "Los Angeles Lakers", name: "Lakers"))
    }
}
