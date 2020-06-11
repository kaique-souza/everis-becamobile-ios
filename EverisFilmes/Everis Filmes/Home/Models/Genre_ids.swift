//
//  File.swift
//  Everis Filmes
//
//  Created by Kaique Santos Souza on 6/10/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import Foundation

class Genre_ids: NSObject, Decodable{
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    let id: Int?
    let name: String?
    
    init(id: Int, name: String){
        self.id = id
        self.name = name
    }
    
}
