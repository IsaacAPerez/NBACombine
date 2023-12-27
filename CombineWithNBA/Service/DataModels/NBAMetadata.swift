//
//  NBAMetadata.swift
//  CombineWithNBA
//
//  Created by Isaac Perez on 12/26/23.
//

/// Represents metadata associated with NBA data.
struct NBAMetadata: Codable {
    /// The total number of pages available for pagination.
    let total_pages: Int
    
    /// The current page number in the paginated data.
    let current_page: Int
    
    /// The next page number in the paginated data. `nil` if there is no next page.
    let next_page: Int?
    
    /// The number of items to be displayed per page in paginated data.
    let per_page: Int
    
    /// The total count of items in the entire dataset.
    let total_count: Int
}
