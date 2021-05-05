//
//  CustomNavigation.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI

struct CustomNavigation: View {
    @State var selectedNavTab = "house"
    
    @State var favouriteList = [PokemonDetails]()
    
    @State var favouriteBall : [PokeballDetails] =  [PokeballDetails(name: "Poke Ball", img: "https://www.serebii.net/itemdex/sprites/pgl/pokeball.png", description: "A device for catching wild Pokémon. It's thrown like a ball at a Pokémon, comfortably encapsulating its target.")]
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            
            TabView(selection: $selectedNavTab) {
                
                Home(favouriteBall: $favouriteBall, favouriteList: $favouriteList).tag("house")
                
                Pokeballs(favouriteBall: $favouriteBall)
                    .tag("p.circle")
                
                Pokedex(favouriteList: $favouriteList)
                    .padding(.horizontal, 25)
                    .tag("magnifyingglass")
                
                Favourites(favouriteList: $favouriteList).tag("heart.circle.fill")
                
                about().tag("questionmark.circle.fill")
                
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea(.all, edges: .bottom)
            
            
            HStack{
                ForEach(navigationTabs, id: \.self) {
                    Navtab in
                    navTab(navTab: Navtab, selectedNavTab: $selectedNavTab)
                    Spacer(minLength: 0)
                    
                }
            }
            .padding(.horizontal,25)
            .padding(.vertical,5)
            .background(Color.white)
            .clipShape(Capsule())
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
            .padding(.horizontal, 20)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .background(Color.blue.opacity(0.1).ignoresSafeArea(.all, edges: .all))
    }
}

let navigationTabs = ["house", "p.circle","magnifyingglass", "heart.circle.fill", "questionmark.circle.fill"]

struct navTab: View {
    var navTab : String
    @Binding var selectedNavTab: String
    var body: some View {
        Button(action: {
                selectedNavTab = navTab
        } ) {
            Image(systemName: navTab).font(.system(size:20))
                .padding(.all)
                .foregroundColor(selectedNavTab == navTab ? Color.blue.opacity(0.4) : Color.black.opacity(0.4))
            
                
        }
    }
}
