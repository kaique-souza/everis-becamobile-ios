//
//  Genero.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/7/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit
import Foundation

class Genero: NSObject, Decodable {
    
    let id: Int?
    let name: String?
    
    init(idGenero: Int, nomeGenero: String) {
        self.id = idGenero
        self.name = nomeGenero
    }
}
