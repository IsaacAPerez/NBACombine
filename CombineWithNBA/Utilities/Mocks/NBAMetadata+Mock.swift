//
//  NBAMetadata+Mock.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/27/23.
//

import Foundation

extension NBAMetadata {
    static func mock() -> NBAMetadata {
        return NBAMetadata(
            total_pages: 3,
            current_page: 1,
            next_page: 2,
            per_page: 10,
            total_count: 25
        )
    }
}
