
//
//  SelectTeamView.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/23/23.
//

import SwiftUI

/// A view for selecting an NBA team.
struct SelectTeamView: View {
    /// The NBA teams to display.
    let nbaTeam: NBATeams?
    
    /// The body of the SelectTeamView.
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                ForEach(nbaTeam!.data) { team in
                    TeamCardView(nbaTeam: team)
                }
            }
        }
        .padding()
        .background(Color("NBABlue"))
    }
}

#Preview {
    let mockNBATeamsData: [NBATeam] = [
        NBATeam(id: 1, abbreviation: "ATL", city: "Atlanta", conference: "Eastern", division: "Southeast", full_name: "Atlanta Hawks", name: "Hawks"),
        NBATeam(id: 2, abbreviation: "BOS", city: "Boston", conference: "Eastern", division: "Atlantic", full_name: "Boston Celtics", name: "Celtics"),
        NBATeam(id: 3, abbreviation: "BKN", city: "Brooklyn", conference: "Eastern", division: "Atlantic", full_name: "Brooklyn Nets", name: "Nets"),
        NBATeam(id: 4, abbreviation: "CHA", city: "Charlotte", conference: "Eastern", division: "Southeast", full_name: "Charlotte Hornets", name: "Hornets"),
        NBATeam(id: 5, abbreviation: "CHI", city: "Chicago", conference: "Eastern", division: "Central", full_name: "Chicago Bulls", name: "Bulls"),
        NBATeam(id: 6, abbreviation: "CLE", city: "Cleveland", conference: "Eastern", division: "Central", full_name: "Cleveland Cavaliers", name: "Cavaliers"),
        NBATeam(id: 7, abbreviation: "DAL", city: "Dallas", conference: "Western", division: "Southwest", full_name: "Dallas Mavericks", name: "Mavericks"),
        NBATeam(id: 8, abbreviation: "DEN", city: "Denver", conference: "Western", division: "Northwest", full_name: "Denver Nuggets", name: "Nuggets"),
        NBATeam(id: 9, abbreviation: "DET", city: "Detroit", conference: "Eastern", division: "Central", full_name: "Detroit Pistons", name: "Pistons"),
        NBATeam(id: 10, abbreviation: "GSW", city: "Golden State", conference: "Western", division: "Pacific", full_name: "Golden State Warriors", name: "Warriors"),
        NBATeam(id: 11, abbreviation: "HOU", city: "Houston", conference: "Western", division: "Southwest", full_name: "Houston Rockets", name: "Rockets"),
        NBATeam(id: 12, abbreviation: "IND", city: "Indiana", conference: "Eastern", division: "Central", full_name: "Indiana Pacers", name: "Pacers"),
        NBATeam(id: 13, abbreviation: "LAC", city: "Los Angeles", conference: "Western", division: "Pacific", full_name: "LA Clippers", name: "Clippers"),
        NBATeam(id: 14, abbreviation: "LAL", city: "Los Angeles", conference: "Western", division: "Pacific", full_name: "Los Angeles Lakers", name: "Lakers"),
        NBATeam(id: 15, abbreviation: "MEM", city: "Memphis", conference: "Western", division: "Southwest", full_name: "Memphis Grizzlies", name: "Grizzlies"),
        NBATeam(id: 16, abbreviation: "MIA", city: "Miami", conference: "Eastern", division: "Southeast", full_name: "Miami Heat", name: "Heat"),
        NBATeam(id: 17, abbreviation: "MIL", city: "Milwaukee", conference: "Eastern", division: "Central", full_name: "Milwaukee Bucks", name: "Bucks"),
        NBATeam(id: 18, abbreviation: "MIN", city: "Minnesota", conference: "Western", division: "Northwest", full_name: "Minnesota Timberwolves", name: "Timberwolves"),
        NBATeam(id: 19, abbreviation: "NOP", city: "New Orleans", conference: "Western", division: "Southwest", full_name: "New Orleans Pelicans", name: "Pelicans"),
        NBATeam(id: 20, abbreviation: "NYK", city: "New York", conference: "Eastern", division: "Atlantic", full_name: "New York Knicks", name: "Knicks"),
        NBATeam(id: 21, abbreviation: "OKC", city: "Oklahoma City", conference: "Western", division: "Northwest", full_name: "Oklahoma City Thunder", name: "Thunder"),
        NBATeam(id: 22, abbreviation: "ORL", city: "Orlando", conference: "Eastern", division: "Southeast", full_name: "Orlando Magic", name: "Magic"),
        NBATeam(id: 23, abbreviation: "PHI", city: "Philadelphia", conference: "Eastern", division: "Atlantic", full_name: "Philadelphia 76ers", name: "76ers"),
        NBATeam(id: 24, abbreviation: "PHX", city: "Phoenix", conference: "Western", division: "Pacific", full_name: "Phoenix Suns", name: "Suns"),
        NBATeam(id: 25, abbreviation: "POR", city: "Portland", conference: "Western", division: "Northwest", full_name: "Portland Trail Blazers", name: "Trail Blazers"),
        NBATeam(id: 26, abbreviation: "SAC", city: "Sacramento", conference: "Western", division: "Pacific", full_name: "Sacramento Kings", name: "Kings"),
        NBATeam(id: 27, abbreviation: "SAS", city: "San Antonio", conference: "Western", division: "Southwest", full_name: "San Antonio Spurs", name: "Spurs"),
        NBATeam(id: 28, abbreviation: "TOR", city: "Toronto", conference: "Eastern", division: "Atlantic", full_name: "Toronto Raptors", name: "Raptors"),
        NBATeam(id: 29, abbreviation: "UTA", city: "Utah", conference: "Western", division: "Northwest", full_name: "Utah Jazz", name: "Jazz"),
        NBATeam(id: 30, abbreviation: "WAS", city: "Washington", conference: "Eastern", division: "Southeast", full_name: "Washington Wizards", name: "Wizards")
    ]

    let mockNBAMeta: NBAMetadata = NBAMetadata(total_pages: 1, current_page: 1, next_page: nil, per_page: 30, total_count: mockNBATeamsData.count)

    let mockNBATeams: NBATeams = NBATeams(data: mockNBATeamsData, meta: mockNBAMeta)

    return SelectTeamView(nbaTeam: mockNBATeams)
}
