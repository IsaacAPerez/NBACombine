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
    
    /// A closure to be called when the card is tapped, passing the team ID.
    var onDidTap: (Int) -> Void
    
    /// The body of the TeamCardView.
    var body: some View {
        VStack {
            Text(nbaTeam.name)
                .font(.custom("NBA Lakers", size: 40))
            
//            Text(nbaTeam.city)
//                .font(.custom("NBA Lakers", size: 20))
            
            Text(nbaTeam.conference)
                .font(.custom("NBA Lakers", size: 15))
            
            NBAButton(title: "Tap", action: { onDidTap(nbaTeam.id) })
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
        TeamCardView(nbaTeam: .mock(team: .lakers), onDidTap: {_ in })
    }
}
