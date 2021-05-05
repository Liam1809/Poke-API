//
//  pokemonDetails.swift
//  Poke
//
//  Created by Liam on 30/03/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import Kingfisher

struct pokemonInfo: View {
   @State var pokemon : PokemonDetails
    
    @ObservedObject var viewModel = PokemonViewModel()
    
//    @AppStorage("toggled") var toggled = falses
    
    let heartIcon = Color(red: 250/255, green: 159/255, blue: 171/255)

    var body: some View {
        
       
        ZStack {
            Image("ball")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .frame(width: 700, height: 700)
                .opacity(0.7)
                .offset(x: 0, y: -250)
                .padding(.leading, 20.0)
            
            
            VStack {
                
                KFImage(URL(string: pokemon.img))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .brightness(0.05)
                    .contrast(1.2)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: 5, y: 5)
                    .shadow(color: .blue.opacity(0.3), radius: 5, x: -5, y: -5)
                    .offset(x: 0, y: 50)
                    .background(
                        Image("Light")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .opacity(0.3)
                            .offset(x: 30, y: 40)
                            .rotationEffect(.degrees(45))
                    )

                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                        
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false) {
                    
                    
                    VStack(alignment: .leading) {
                            HStack (alignment: .firstTextBaseline) {
                                
                                Text("\(pokemon.name)")
                                    .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                                Text("#\(pokemon.num)").font(.headline)
                                
                            }
                            .padding(.bottom, 10.0)

                            
                            HStack {
                                Text("Type: ")
                                ForEach(pokemon.type, id: \.self){ value in
                                    Text(value)
                                        .padding(.horizontal, 20.0)
                                        .padding(.vertical, 5.0)
                                        .background(viewModel.backgroundColor(type: value))
                                        .cornerRadius(15)
                                }
                            }
                          
                            HStack {
                                Text("Weight: \(pokemon.weight) - Height: \(pokemon.height)")
                            }.padding(.vertical, 5.0)
                            
                            HStack {
                                Text("Weakness: ")
                                ForEach(pokemon.weaknesses, id: \.self){ value in
                                    Text(value)
                                        .padding(.horizontal, 10.0)
                                        .padding(.vertical, 5.0)
                                        .background(viewModel.backgroundColor(type: value))
                                        .cornerRadius(15)
                                }
                            }.padding(.bottom, 5.0)
                            
                            HStack {
                                Text("Egg: \(pokemon.egg)")
                            }.padding(.bottom, 5.0)
                            
                            HStack {
                                Text("Candy: \(pokemon.candy)")
                            }.padding(.bottom, 5.0)
                    }.padding(.top, 140)
                
                        Text("Sprites")
                        HStack {
                            VStack {
                                AnimatedImage(url: URL(string: "https://projectpokemon.org/images/normal-sprite/\(pokemon.name.lowercased()).gif"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                Text("Normal")
                            }.padding(.horizontal)
                           
                            VStack {
                                AnimatedImage(url: URL(string: "https://projectpokemon.org/images/shiny-sprite/\(pokemon.name.lowercased()).gif"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 60, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .padding(.horizontal)
                                Text("Shiny")
                            }.padding(.horizontal)
                        }.padding(.bottom)
                    
                    if(pokemon.prev_evolution != nil) {
                        Text("Prev Evolution")
                        HStack {
                            ForEach(pokemon.prev_evolution ?? [], id: \.num) { value in
                                
                                    NavigationLink(
                                        destination: pokemonInfo(pokemon: viewModel.poke.first{$0.name == value.name} ?? viewModel.poke[0]),
                                        label: {
                                            VStack {
                                            KFImage(URL(string: "https://www.serebii.net/pokemongo/pokemon/\(value.num).png"))
                                            HStack {
                                                Text("\(value.name) #\(value.num)").foregroundColor(.black)
                                            }
                                            }.padding(.all)
                                        })
                            }
                        }
                    }
                    
                        if(pokemon.next_evolution != nil) {
                            Text("Next Evolution")
                            
                            HStack {
                                ForEach(pokemon.next_evolution ?? [], id: \.num) { value in
                                    
                                    NavigationLink(
                                        destination: pokemonInfo(pokemon: viewModel.poke.first{$0.name == value.name} ?? viewModel.poke[0]),
                                        label: {
                                            VStack {
                                                KFImage(URL(string: "https://www.serebii.net/pokemongo/pokemon/\(value.num).png"))
                                                HStack {
                                                    Text("\(value.name) #\(value.num)").foregroundColor(.black)
                                                }
                                            }.padding(.all)
                                        })
                                }
                            }
                        }
                    
                        }
                    
                    
            
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            
            
           
            
        }
        
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.large)
        
    }
}


}
