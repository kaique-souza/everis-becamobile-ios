//
//  DetalhesFilmesAPI.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

class Genre_idsAPI: NSObject {
    
    //MARk - Atributos
    let chaveApiDetalhes = "b9976ef2334d455f8d61c7f6c2f54d29"
    
    func converteDicinario(json: [[String:Any]])-> Data?{
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    func decodificar(jsonData: Data)-> [Genre_ids]?{
        do{
            let listaPopulada = try JSONDecoder().decode([Genre_ids].self, from: jsonData)
            return listaPopulada
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func consultaDetalheFilmes (completion: @escaping(Array<Genre_ids>)-> Void){
        
        guard let urlRequest = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(chaveApiDetalhes)&language=pt-br") else {return}
        Alamofire.request(urlRequest, method: .get).responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                guard let json = resposta.result.value as? [String: Any] else {return}
                guard let dicionario = json["genres"] as? Array<Dictionary<String, Any>> else {return}
                guard let data =  self.converteDicinario(json: dicionario) else {return}
                guard let listaGenero =  self.decodificar(jsonData: data) else {return}
                completion(listaGenero)
                break
            case .failure:
                print(resposta.error!)
                break
            }
            }.resume()
    }
}
