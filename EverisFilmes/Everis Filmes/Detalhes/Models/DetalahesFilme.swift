//
//  DetalahesFilme.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class DetalahesFilme: NSObject {
    
    let backdropPath: String?
    let genres: [Genero]?
    let id: Int?
    let originalLanguage, overview: String?
    let popularity: Double?
    let posterPath: String?
    let title: String?
    let voteAverage: Double
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case overview, popularity
        case posterPath = "poster_path"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(backDropPath: String, genres: [Genero], overView: String, posterPath: String, title: String, id: Int, originalLiiguage: String, popularity: Double, voteAverage: Double, voteCount: Int){
        
        self.backdropPath = backDropPath
        self.genres =  genres
        self.overview = overView
        self.posterPath = posterPath
        self.title = title
        self.id = id
        self.originalLanguage = originalLiiguage
        self.popularity = popularity
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
    
    
    
    

}
