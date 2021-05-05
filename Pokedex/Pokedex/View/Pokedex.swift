//
//  Pokedex.swift
//  Poke
//
//  Created by Liam on 30/03/2021.
//

import SwiftUI
import SSSwiftUIGIFView
import Kingfisher


struct Pokedex: View {
    @State var text = ""
    @ObservedObject var viewModel = PokemonViewModel()
    
    @Binding var favouriteList : [PokemonDetails]
    
    
    var body: some View {
    
                VStack {
                    // Header
                    HStack {
                        SwiftUIGIFPlayerView(gifName: "Gif/logo")
                            .frame(width: 50.0, height: 50.0)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .offset(x: -15.0)
      
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                        Text("Poke Pokedex")
                            .font(.system(size: 30))
                            .fontWeight(.semibold)
                            .offset(x: -30.0)
                        Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal)
                    // Search Area
                    HStack {
                        TextField("Search for Pokemon", text: $text)
                        Image(systemName: "magnifyingglass")
                    }
                    .padding(.all)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 2, y: 2)
                    .shadow(color: Color.gray.opacity(0.1), radius: 5, x: -2, y: -2)
                
                        ScrollView(.vertical, showsIndicators: false) {
                                    LazyVStack {
                                        ForEach(text == "" ? viewModel.poke : viewModel.poke.filter{$0.name.lowercased().contains(text.lowercased())}, id: \.id) { pokemon in
                                            
                                            NavigationLink(
                                                destination: pokemonInfo(pokemon: pokemon),
                                                label: {
                                                    VStack {
                                                        pokemonCell(pokemon: pokemon, favouriteList: $favouriteList)
                                                    }
                                                })
                                        }
                                }
                        }.padding(.bottom, 100)
            
            }
            
        }

        
    }


