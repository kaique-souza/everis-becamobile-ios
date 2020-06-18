//
//  Filmes.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class Filmes: NSObject {
    
    //MARK - Atributos
    var posterPath: String?
    var adult: Bool?
    var overView: String
    //var releaseDate: Data?
    var genreIds: Array<Int?>
    var id: Int?
    var originalTitle: String?
    var originalLinguage: String?
    var title: String?
    var backDropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?
    var totalPages: Int?
    var totalResults: Int?
    
    init(posterPath: String, adult: Bool, overView: String, genreIds: Array<Int>, id: Int, originalTitle: String, originalLinguage: String, title: String, backDropPath: String, popularity: Double, voteCount: Int, video: Bool, voteAverage: Double){
        
        self.posterPath = posterPath
        self.adult = adult
        self.overView = overView
        //self.releaseDate = releaseDate
        self.genreIds = genreIds
        self.id = id
        self.originalTitle = originalTitle
        self.originalLinguage = originalLinguage
        self.title = title
        self.backDropPath = backDropPath
        self.popularity = popularity
        self.voteCount = voteCount
        self.video = video
        self.voteAverage = voteAverage
//        self.totalPages = totalPages
//        self.totalResults =  totalResults
        
    }
    
}
