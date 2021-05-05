//
//  Onboarding.swift
//  Poke
//
//  Created by Liam on 05/05/2021.
//

import SwiftUI
import SSSwiftUIGIFView


struct Onboarding: View {
    @AppStorage("currentScreen") var currentScreen = 1
    var body: some View {
    
        ZStack {
            
            VStack(alignment: .center) {
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                    SwiftUIGIFPlayerView(gifName: "Gif/pokeball")
                        .frame(width: 500, height: 500, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .padding(.all)
                        
                    
                    SwiftUIGIFPlayerView(gifName: "Gif/pikachu")
                        .frame(width: 200, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .offset(x: 0, y: -230)
                        .padding(.all)
                
                 Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("Welcome to Poke Pokedex")
                        .font(.title)
                        .padding(.all)
                
                    Button(action: {
                                if currentScreen <= 1 {
                                    currentScreen += 1
                                }
                        }, label: {
                            Text("Continue to App")
                                .padding(.all)
                                .background(Color.purple)
                                .cornerRadius(15.0)
                                .foregroundColor(.white)
                        })
                }
                .offset(x: 0, y: -250)
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
            }
           
            
            
        }
        .padding(.all)
        .background(
                Image("mainbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                    .frame(width: 500, height: 1000)
        )
        .ignoresSafeArea(.all, edges: .all)

    }
}

