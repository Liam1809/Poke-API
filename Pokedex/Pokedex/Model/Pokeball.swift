//
//  Pokeball.swift
//  Poke
//
//  Created by Liam on 05/05/2021.
//

import Foundation

struct PokeballDetails : Decodable {
    let id = UUID()
    let name : String
    let img : String
    let description : String
}
