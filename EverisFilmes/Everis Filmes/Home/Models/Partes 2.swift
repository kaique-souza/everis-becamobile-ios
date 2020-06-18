//
//  Partes.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class Partes: NSObject {
    
    //MARK- Atributos
  
    
    init(adulto: Bool, backDropPath: String, genreIds: Array<Int>, euIria: Int, linguagemOriginal: String, tituloOriginal: String, visaoGeral: String, dataLancamento: Data, posterPath: String, popularidade: String, titulo: String, video: Bool, voteAverage: Double, voteCount: Int){
       
        self.adulto = adulto
        self.backDropPath = backDropPath
        self.genreIds = genreIds
        self.euIria = euIria
        self.linguagemOriginal = linguagemOriginal
        self.tituloOriginal = tituloOriginal
        self.visaoGeral = visaoGeral
        self.dataLancamento = dataLancamento
        self.posterPath = posterPath
        self.popularidade = popularidade
        self.titulo = titulo
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount

    }
    
    

}
