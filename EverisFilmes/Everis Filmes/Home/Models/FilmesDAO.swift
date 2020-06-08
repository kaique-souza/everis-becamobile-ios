//
//  FilmesDAO.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class FilmesDAO: NSObject {
    
    //Mark - Atributos
    var listaFilmesRecuperados: Array<Filmes> = []
    
    //Mark - Metodos
      func instaciaFilmes(listaDeFilmes: Array<Dictionary<String,Any>>) -> Array<Filmes>{
        
        for listaFilmes in listaDeFilmes{
    
            guard let posterPathJson = listaFilmes["poster_path"] as? String else {return [] }
            guard let overViewJson = listaFilmes["overview"] as? String else {return [] }
            guard let idJson = listaFilmes["id"] as? Int else {return [] }
            //guard let titleJson = listaFilmes["original_title"] as? String else { return [] }
            guard let backDropPathJson = listaFilmes["backdrop_path"] as? String else {return [] }
            guard let popularityJson = listaFilmes["popularity"] as? Double else {return [] }
            guard let voteCountJson = listaFilmes["vote_count"] as? Int else {return[] }
            guard let voteAverageJson = listaFilmes["vote_average"] as? Double else {return [] }
            
            let filmes =  Filmes(posterPath: posterPathJson, adult: false, overView: overViewJson, genreIds: [], id: idJson, originalTitle: "", originalLinguage: "", title: "", backDropPath: backDropPathJson, popularity: popularityJson, voteCount: voteCountJson, video: false, voteAverage: voteAverageJson)
            listaFilmesRecuperados.append(filmes)
        }
        
        return listaFilmesRecuperados
    }
    
}
