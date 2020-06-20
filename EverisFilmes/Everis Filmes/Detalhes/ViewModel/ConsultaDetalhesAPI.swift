//
//  ConsultaDetalhesAPI.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/20/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Alamofire

class ConsultaDetalhesAPI: NSObject {
    //MARK - Atributos
    let chaveAPIDetalhe = "b9976ef2334d455f8d61c7f6c2f54d29"
    
    //MARK - Metodos
    func converteDicionario(_ dicionario: Dictionary<String, Any>) -> Data?{
        return try! JSONSerialization.data(withJSONObject: dicionario, options: [])
    }
    
    func serializaJson (jsonData: Data) -> DetalhesFilmes?{
        do{
            let detalhe = try JSONDecoder().decode(DetalhesFilmes.self, from: jsonData)
            return detalhe
        }catch{
            print(error.localizedDescription)
            return nil
        }
    }
    
    func consultaApiDetalhesFilmes(_ id: Int, sucesso: @escaping(DetalhesFilmes) -> Void){
       
        let url =  "https://api.themoviedb.org/3/movie/\(id)?api_key=\(chaveAPIDetalhe)&language=pt-br"
        print(url)
        Alamofire.request(url, method: .get).validate().responseJSON { (resposta) in
            switch resposta.result{
            case .success:
                guard let json = resposta.result.value as? Dictionary<String, Any> else {return}
                guard let jsonData = self.converteDicionario(json) else {return}
                guard let detalhe = self.serializaJson(jsonData: jsonData) else {return}
                sucesso(detalhe)
                break
            case .failure:
                print(resposta.error!.localizedDescription)
                break
            }
        }
    }
}
