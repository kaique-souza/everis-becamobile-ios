//
//  DetalhesFilmes.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/20/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Foundation

class DetalhesFilmes: NSObject, Decodable {
 
    
    // MARK: - Atributos
    let adult: Bool?
    let backdropPath: String?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let status, title: String?
    let voteAverage: Double?
    let voteCount: Int?
        
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres
        case homepage
        case id
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case status
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    init(adult: Bool, backdropPath: String, genre: [Genre], homepage: String, id: Int, overview: String, popularity: Double, posterPath: String, releaseDate: String, status: String, title: String, voteAverage: Double, voteCount: Int){
        self.adult = adult
        self.backdropPath = backdropPath
        self.genres = genre
        self.homepage = homepage
        self.id = id
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.status = status
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}


// MARK: - Genre
class Genre: NSObject, Codable {
    let id: Int?
    let name: String?
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
}

