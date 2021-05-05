//
//  pokemonCell.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI
import SSSwiftUIGIFView
import Kingfisher

struct pokemonCell: View {
    @State var pokemon: PokemonDetails
    
    @Binding var favouriteList : [PokemonDetails]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    @State var toggled: Bool = false
    
    let heartIcon = Color(red: 250/255, green: 159/255, blue: 171/255)
    var body: some View {
        
            
            VStack(spacing: 0) {
                // upper cell
                
                HStack {
                    KFImage(URL(string: pokemon.img))
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .frame(width: 80.0, height: 80.0)
                        .padding(.leading)
                        
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    Text(pokemon.name.capitalized)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .offset(x: -10.0)
               
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    
                    Button(action: {
                        toggled.toggle()
                        if toggled {
                            favouriteList.append(pokemon)
                            
                        } else {
                            favouriteList = favouriteList.filter {$0.name != pokemon.name}
                        }

                    }, label: {
                        if favouriteList.contains(where: {$0.name == pokemon.name}) {
                            Image(systemName: "suit.heart.fill")
                                .font(.system(size: 28))
                                .foregroundColor(heartIcon)
                        } else {
                            Image(systemName: "suit.heart")
                                .font(.system(size: 28))
                                .foregroundColor(heartIcon)
                        }
                    })
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }
                .background(Color.white)
               // lower cell
                HStack {
                    
                    Text("#\(pokemon.num)")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 30)
                        .padding(.vertical, 10)
                    Spacer(minLength: 0)
                    Spacer(minLength: 0)
                    Text(pokemon.type[0])
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 5)
                        .background(Color.white)
                        .cornerRadius(25)
                    Spacer(minLength: 0)
                }
                .background(viewModel.backgroundColor(type: pokemon.type[0]))
            }
            .cornerRadius(30.0)
            .shadow(radius: 5)
            .padding(.top, 10)
            .padding(.horizontal,30)
        }
    }
