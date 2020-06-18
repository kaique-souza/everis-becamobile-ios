//
//  teste.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/5/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class teste: NSObject {
    let titutlo:String?
    let popularidde: Double?
    let imagem: String?
    
    init(titulo: String, popularidade: Double, imagem: String) {
        self.titutlo = titulo
        self.popularidde = popularidade
        self.imagem = imagem
    }
}
