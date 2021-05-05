//
//  pokemonViewModel.swift
//  Poke
//
//  Created by Liam on 31/03/2021.
//

import SwiftUI


class PokemonViewModel: ObservableObject {
    @Published var poke = [PokemonDetails]()
    
    let baseURL = "https://raw.githubusercontent.com/Liam1809/Poke-API/master/poke-pokedex.json"
    
    init() {
        fetchPokemon()
    }
 
    func fetchPokemon() {
        
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            guard let pokes = try? JSONDecoder().decode([PokemonDetails].self, from: data!) else { return }
            DispatchQueue.main.async {
                self.poke = pokes
            }

        }.resume()
        
    }
    
    func backgroundColor(type: String) -> Color {
        switch type {
        case "Bug", "Grass":
            return Color.green.opacity(0.5)
        case "Fire":
            return Color.red.opacity(0.5)
        case "Ice", "Water":
            return Color.blue.opacity(0.5)
        case "Poison":
            return Color.purple.opacity(0.5)
        case "Electric":
            return Color.yellow.opacity(0.5)
        case "Fighting", "Ground", "Rock":
            return Color.orange.opacity(0.5)
        case "Ghost", "Psychic":
            return Color.pink.opacity(0.5)
        case "Dragon":
            return Color.primary.opacity(0.5)
        default:
            return Color.gray.opacity(0.5)
        }
    }
   
}



