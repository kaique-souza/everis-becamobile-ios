//
//  FilmesDecodable.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/8/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import Foundation

class Filmes: NSObject, Decodable{
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case title
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case popularity
        case overview
    }
    
        let id: Int?
        let voteCount: Int?
        let voteAverage: Double?
        let title: String?
        let originalLanguage: String?
        let originalTitle: String?
        let genreIDS: [Int]?
        let backdropPath: String?
        let overview: String?
        let posterPath: String?
        let popularity: Double?
    
    init(posterPath: String, adult: Bool, overView: String, genreIds: Array<Int>, id: Int, originalTitle: String, originalLinguage: String, title: String, backDropPath: String, popularity: Double, voteCount: Int, video: Bool, voteAverage: Double){
        
        self.posterPath = posterPath
        self.overview = overView
        self.genreIDS = genreIds
        self.id = id
        self.originalTitle = originalTitle
        self.originalLanguage = originalLinguage
        self.title = title
        self.backdropPath = backDropPath
        self.popularity = popularity
        self.voteCount = voteCount
        self.voteAverage = voteAverage
    }
}
