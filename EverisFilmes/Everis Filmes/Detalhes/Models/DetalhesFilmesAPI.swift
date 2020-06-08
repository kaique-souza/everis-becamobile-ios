//
//  DetalhesFilmesAPI.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

class DetalhesFilmesAPI: NSObject {
    
    //MARk - Atributos
    let chaveApiDetalhes = ""
    
    func consultaDetalheFilmes (idFilme: Int){
        
        guard let urlRequest = URL(string: "https://api.themoviedb.org/3/movie/\(idFilme)?api_key=b9976ef2334d455f8d61c7f6c2f54d29&language=pt-BR") else {return}
        
        Alamofire.request(urlRequest, method: .get).responseJSON { (resposta) in
            switch resposta.result{
                case .success:
                    guard let json = resposta.result.value as? Dictionary<String, Any> else {return}
                    print(json)
                    //            print("-------")
                    //            print(genres)
                break
                
                case .failure:
                    print(resposta.error!)
                break
            }
        }
    }

}
