//
//  DetalhesViewModel.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/15/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class DetalhesViewModel: NSObject {
    
    //MARK - Metodos
    func formatData(_ data: String)-> String{
        let dataEntrada = data
        let dateFormatterSaida = DateFormatter()
        dateFormatterSaida.dateFormat = "yyyy-MM-dd"
        let date = dateFormatterSaida.date(from: dataEntrada)
        dateFormatterSaida.dateFormat = "dd/MM/yyyy"
        let dataSaida = dateFormatterSaida.string(from: date!)
        return dataSaida
    }
    
    func formatLabelAdult(listaFilmes: Filmes, labelAdult: UILabel) -> UILabel{
        if let adulto = listaFilmes.adult {
            if adulto{
                labelAdult.text = "Adulto"
                labelAdult.textColor = UIColor.red
                return labelAdult
            }else{
                labelAdult.text = "Livre"
                labelAdult.textColor = UIColor(displayP3Red: 0.0/255, green: 128.0/255, blue: 0.0/255, alpha: 1.0)
                return labelAdult
            }
        }
        return labelAdult
    }
    
    func removeIdTrailler(_ listaID: [Int])-> [Int]{
        for id in listaID{
            if id != 53{
                let ids: [Int] = [id]
                return ids
            }
        }
        return [0]
    }
    //Resolvi adicionar so o primeiro genero que retorna na lista pois iria ficar muito poluida a tela
    func formataLabelGenero(_ lista: Filmes, listaGeneros: Array<Genre_ids>)-> String{
        guard let idsGenero = lista.genreIDS else {return ""}
        let listaIDS = removeIdTrailler(idsGenero)
        guard let id = listaIDS.first else {return ""}
        for lista in listaGeneros{
            if id == lista.id{
                guard let genero = lista.name else {return ""}
                return genero
            }
        }
        return "Sem classificação"
    }
}


