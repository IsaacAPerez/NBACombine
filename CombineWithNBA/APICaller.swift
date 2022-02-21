//
//  APICaller.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 2/16/22.
//

import Foundation
import Combine

struct NBATeam: Codable {
    let id: Int
    let abbreviation: String
    let city: String
    let conference: String
    let division: String
    let full_name: String
    let name: String
}

class APICaller {
    static let shared = APICaller()
    var cancellables = Set<AnyCancellable>()
    static var team: NBATeam?
    
    
    func fetchNBA() {
         URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.balldontlie.io/api/v1/teams/14")!)
            .receive(on: DispatchQueue.main)
        .map { $0.data }
        .decode(type: NBATeam.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(String(describing: error))
            }
        }, receiveValue: { posts in
            
            APICaller.team = posts
        })
        .store(in: &cancellables)

    }
    
    func getTeam() -> Set<AnyCancellable> {
        return cancellables
    }
    
}
