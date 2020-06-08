//
//  FIilmesCodeble.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/5/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class FilmesCodeble: Codable {
 
// MARK: - Result
    let id: Int = 0
    let voteCount: Int = 0
    let voteAverage: Double = 0.0
    //let title: String
    let originalTitle: String = ""
    let genreIDS: [Int] = []
    let backdropPath: String = ""
    let adult: Bool = false
    let overview = "",
    let posterPath: = String = "",
    let popularity: Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case id, video
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        //case title
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult = "adult"
        case posterPath = "poster_path"
        case popularity = "popularity"
        case mediaType = "media_type"
    }

}
