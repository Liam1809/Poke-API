//
//  Pokemon.swift
//  Poke
//
//  Created by Liam on 30/03/2021.
//

import Foundation
import SwiftUI


struct PokemonDetails: Decodable {
    let id = UUID()
    let name: String
    let img: String
    let type: [String]
    let num: String
    let height: String
    let weight: String
    let egg: String
    let candy: String
    let weaknesses: [String]
    let prev_evolution: [PokemonEvo]?
    let next_evolution: [PokemonEvo]?
}

struct PokemonEvo: Decodable {
    let num: String
    let name: String
}

