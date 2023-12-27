//
//  NBATeam.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

/// Represents an NBA team.
struct NBATeam: Identifiable, Codable {
    /// The unique identifier for the NBA team.
    let id: Int
    
    /// The abbreviated name of the NBA team.
    let abbreviation: String
    
    /// The city where the NBA team is located.
    let city: String
    
    /// The conference to which the NBA team belongs (e.g., "Eastern", "Western").
    let conference: String
    
    /// The division in which the NBA team plays.
    let division: String
    
    /// The full name of the NBA team.
    let full_name: String
    
    /// The name of the NBA team.
    let name: String
}
