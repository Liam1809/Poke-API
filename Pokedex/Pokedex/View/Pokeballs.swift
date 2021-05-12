//
//  Pokeball.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI
import SSSwiftUIGIFView
import Kingfisher


// screen of all pokeballs
struct Pokeballs: View {
    
    @State var text = ""
    @ObservedObject var viewModel = PokeballViewModel()
    @State var toggled = false
    @Binding var favouriteBall : [PokeballDetails] 
    
    
    var body: some View {
        
        VStack {
            
            // Header
            HStack {
                SwiftUIGIFPlayerView(gifName: "Gif/logo")
                    .frame(width: 50.0, height: 50.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .offset(x: -15.0)

                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Text("Pokeball")
                    .font(.system(size: 30))
                    .fontWeight(.semibold)
                    .offset(x: -30.0)
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
            .padding(.top, 20)
            .padding(.horizontal, 30)
            
            // Search Area
            HStack {
                TextField("Search for Pokeball", text: $text)
                Image(systemName: "magnifyingglass")
            }
            .padding(.all)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 2, y: 2)
            .shadow(color: Color.gray.opacity(0.1), radius: 5, x: -2, y: -2)
            .padding(.horizontal, 20)
        
            // List of Pokeballs
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 5) {
                                ForEach(text == "" ? viewModel.pokeball : viewModel.pokeball.filter{$0.name.lowercased().contains(text.lowercased())}, id: \.id) { pokeball in
                                    NavigationLink(
                                        destination: PokeballInfo(pokeball: pokeball),
                                        label: {
                                            VStack {
                                                KFImage(URL(string: pokeball.img))
                                                    .renderingMode(.original)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                                
                                                Text(pokeball.name)
                                                    .font(/*@START_MENU_TOKEN@*/.body/*@END_MENU_TOKEN@*/)
                                                    .foregroundColor(.black)
                                                
                                                Button(action: {
                                                    favouriteBall.removeAll()
                                                    toggled = true
                                                    
                                                    if toggled {
                                                        favouriteBall.append(pokeball)
                                                    }
                                                    
                                                }, label: {

                                                    if favouriteBall.contains(where: {$0.name == pokeball.name}) {
                                                        Image(systemName: "star.fill")
                                                            .font(.system(size: 20))
                                                            .foregroundColor(.yellow)
                                                        
                                                    } else {
                                                        Image(systemName: "star")
                                                            .font(.system(size: 20))
                                                            .foregroundColor(.yellow)
                                                    }
                                                })
                                            }.padding(.all)
                                        })
                                }
                        }
                }
                .padding(.bottom, 100)
        }
    }
}
