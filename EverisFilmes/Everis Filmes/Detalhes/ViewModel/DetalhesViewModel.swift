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
    
    func formatLabelAdult(_ detalhe: DetalhesFilmes, labelAdult: UILabel) -> UILabel{
        if let adulto = detalhe.adult {
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
    
    //Resolvi adicionar so o primeiro genero que retorna na lista pois iria ficar muito poluida a tela
    func formataLabelGenero(_ detalhe: DetalhesFilmes)-> String{
        var GeneroSaida: String = ""
        guard let listageneros = detalhe.genres else {return "Sem classificação"}
        for genero in listageneros{
            if let name = genero.name, genero.id != 53{
                GeneroSaida = name
                //GeneroSaida +=  name + ", "
                return GeneroSaida
            }
        }
        
        return "Sem classificação"
    }
}


