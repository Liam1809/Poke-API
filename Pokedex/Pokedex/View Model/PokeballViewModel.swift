//
//  PokeballViewModel.swift
//  Poke
//
//  Created by Liam on 05/05/2021.
//

import Foundation
import SwiftUI


class PokeballViewModel: ObservableObject {
    @Published var pokeball = [PokeballDetails]()
    
    let baseURL = "https://raw.githubusercontent.com/Liam1809/Poke-API/master/poke-pokeball.json"
    
    init() {
        fetchPokeball()
    }
 
    func fetchPokeball() {
        
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            guard let pokeballs = try? JSONDecoder().decode([PokeballDetails].self, from: data!) else { return }
            
            DispatchQueue.main.async {
                self.pokeball = pokeballs
            }

        }.resume()
        
    }
}
