//
//  FilmesAPI.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/4/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire
import Foundation

class FilmesAPI: NSObject {
    
    //MARK- Atributos
    var ChaveAPI = "b9976ef2334d455f8d61c7f6c2f54d29"
  
    var listaRecuperada: Array<Filmes> =  []
    
    //MARK- Metodos
    func converteDicinario(json: [[String:Any]])-> Data?{
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    func decodificar(jsonData: Data)-> [Filmes]?{
        do{
            let listaPopulada = try JSONDecoder().decode([Filmes].self, from: jsonData)
            return listaPopulada
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func consultaFilmes(completion: @escaping(Array<Filmes>)-> Void){
        guard let urlListaFilmes = URL(string: "https://api.themoviedb.org/3/trending/movie/week?api_key=\(ChaveAPI)&language=pt-br") else {return}
        
        Alamofire.request(urlListaFilmes, method: .get).responseJSON { (resposta)in
            switch resposta.result{
                case .success:
                    guard let json = resposta.result.value as? Dictionary<String, Any> else {return}
                    guard let dicionario = json["results"] as? Array<Dictionary<String, Any>> else {return}
                    guard let dados = self.converteDicinario(json: dicionario) else {return}
                    guard let listaPopulada = self.decodificar(jsonData: dados) else {return}
                    completion(listaPopulada)
                break
                case .failure:
                    print(resposta.error!)
                break
            }
        }.resume()
     }
}
