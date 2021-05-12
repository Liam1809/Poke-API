//
//  PokeballInfo.swift
//  Pokedex
//
//  Created by Liam on 12/05/2021.
//

import SwiftUI
import Kingfisher

// screen for specific pokeball
struct PokeballInfo: View {
    var pokeball : PokeballDetails
    
    var body: some View {
        
        VStack {
            Image("throwing")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 350, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text(pokeball.name)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
                   Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Text(pokeball.description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }

            KFImage(URL(string: pokeball.img))
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: -340)
        }
        .padding(.all)
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.large)
    }
}
