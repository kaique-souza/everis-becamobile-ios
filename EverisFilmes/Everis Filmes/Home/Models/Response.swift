//
//  Response.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/5/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Foundation

class Response: Codable {
    let id: Int
    let voteCount: Int
    let voteAverage: Double
    //let title: String
    let originalTitle: String
    let genreIDS: [Int]
    let backdropPath: String
    let adult: Bool
    let overview: String
    let posterPath: String
    let popularity: Double
    
//    enum CodingKeys: String, CodingKey {
//        case id, video
//        case voteCount = "vote_count"
//        case voteAverage = "vote_average"
//        //case title
//        case genreIDS = "genre_ids"
//        case backdropPath = "backdrop_path"
//        case adult = "adult"
//        case posterPath = "poster_path"
//        case popularity = "popularity"
//        case mediaType = "media_type"
//    }
}
