//
//  Home.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI
import SSSwiftUIGIFView
import Kingfisher
import SDWebImageSwiftUI

struct Home: View {
    @Binding var favouriteBall : [PokeballDetails]
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
            .padding(.horizontal, 30)
            VStack {
                KFImage(URL(string: favouriteBall[0].img))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text(favouriteBall[0].name)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    
                Text(favouriteBall[0].description)
                    .font(.system(size: 18))
                    .multilineTextAlignment(.center)
                    .padding([.leading, .bottom, .trailing])
                Text("Favourite Pokemon")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], alignment: .center) {
                ForEach(favouriteList, id: \.id) { poke in
                    AnimatedImage(url: URL(string: "https://projectpokemon.org/images/normal-sprite/\(poke.name.lowercased()).gif"))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.all)
                }
            }.frame(width: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            
            Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
        }
       
        }
        
}

