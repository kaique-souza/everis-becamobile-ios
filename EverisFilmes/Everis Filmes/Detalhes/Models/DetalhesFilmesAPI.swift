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
    let chaveApiDetalhes = "b9976ef2334d455f8d61c7f6c2f54d29"
    
    func converteDicinarioDetalhes(json: [[String:Any]])-> Data?{
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }
    
    func decodificarDetahes(jsonData: Data)-> [DetalhesFilme]?{
        do{
            let listaPopulada = try JSONDecoder().decode([DetalhesFilme].self, from: jsonData)
            return listaPopulada
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func consultaDetalheFilmes (idFilme: Int, completion: @escaping(Array<DetalhesFilme>)-> Void){
        
        guard let urlRequest = URL(string: "https://api.themoviedb.org/3/movie/\(idFilme)?api_key=\(chaveApiDetalhes)&language=pt-BR") else {return}
        Alamofire.request(urlRequest, method: .get).responseJSON { (resposta) in
            switch resposta.result{
                case .success:
                    guard let json = resposta.result.value as? [[String: Any]] else {return}
                    //guard let dicionario = json["production_countries"] as? Array<Dictionary<String, Any>> else {return}
                    guard let dados = self.converteDicinarioDetalhes(json: json) else {return}
                    guard let listaPopulada = self.decodificarDetahes(jsonData: dados) else {return}
                    
//                    guard let json = resposta.result.value as? Dictionary<String, Any> else {return}
//                    guard let dicionario = json["production_countries"] as? Array<Dictionary<String, Any>> else {return}
//                    guard let dados = self.converteDicinarioDetalhes(json: dicionario) else {return}
//                    guard let listaPopulada = self.decodificarDetahes(jsonData: dados) else {return}
                    completion(listaPopulada)
                break
                case .failure:
                    print(resposta.error!)
                break
            }
        }.resume()
    }
}
