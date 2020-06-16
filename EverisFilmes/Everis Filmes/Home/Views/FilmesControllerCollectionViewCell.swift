//
//  FilmesControllerCollectionViewCell.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import AlamofireImage


class FilmesControllerCollectionViewCell: UICollectionViewCell{

    //MARK - Outlets
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelPopularity: UILabel!
    @IBOutlet weak var labelVotos: UILabel!
    //MARK - Metodos
    
    func acessibilityComponents(){
        //Imagem
        imagePoster.isAccessibilityElement = true
        imagePoster.accessibilityHint = "Clique para ver os detalhes do filme"
        imagePoster.accessibilityTraits = .button
        
        labelPopularity.accessibilityHint = "Popula"
    
    }

    func formataCollection(_ listaFilmes: Filmes){
        self.acessibilityComponents()
        guard let imagem = listaFilmes.posterPath else {return}
         let urlImagem = "https://image.tmdb.org/t/p/original\(imagem)"
        guard let imageUrl = URL(string: urlImagem) else {return}
        self.imagePoster.af_setImage(withURL: imageUrl)
        guard let popularity = (listaFilmes.popularity)?.description else {return}
        labelPopularity.text =  popularity
        labelVotos.text = (listaFilmes.voteCount)?.description
    }
    

}

