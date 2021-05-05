//
//  Favourites.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI
import Kingfisher

struct Favourites: View {
    @ObservedObject var viewModel = PokemonViewModel()
    
    @Binding var favouriteList : [PokemonDetails]
    var body: some View {
        VStack{
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            Text("Favourite Pokemon")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .padding(.top, 40)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(favouriteList, id: \.id) { value in
                        NavigationLink(
                            destination: pokemonInfo(pokemon: viewModel.poke.first{$0.name == value.name} ?? viewModel.poke[0]),
                            label: {

                                VStack {
                                    KFImage(URL(string: "https://www.serebii.net/pokemongo/pokemon/\(value.num).png"))
                                    HStack {
                                        Text("\(value.name)").foregroundColor(.black)
                                    }
                                }.padding(.all)
                            })
                    }
                }
            }
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
            
            
        }
    }
}


