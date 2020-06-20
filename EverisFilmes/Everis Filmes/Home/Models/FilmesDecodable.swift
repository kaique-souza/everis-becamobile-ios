//
//  FilmesDecodable.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/8/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import Foundation

class Filmes: NSObject, Decodable{
    
    
    let id: Int?
    let voteCount: Int?
    let voteAverage: Double?
    var title: String?
    let originalLanguage: String?
    let originalTitle: String?
    let genreIDS: [Int]?
    let backdropPath: String?
    var overview: String?
    let posterPath: String?
    let popularity: Double?
    let release_date: String?
    let adult: Bool?
    
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
        case release_date
        case adult
    }
    
    init(posterPath: String, overView: String, genreIds: Array<Int>, id: Int, originalTitle: String, originalLinguage: String, title: String, backDropPath: String, popularity: Double, voteCount: Int, voteAverage: Double, release_date: String, adult: Bool){
        
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
        self.release_date = release_date
        self.adult = adult
    }
}
