//
//  about.swift
//  Poke
//
//  Created by Liam on 02/04/2021.
//

import SwiftUI
import SSSwiftUIGIFView

// this screen for showing app's info
struct about: View {
    var body: some View {
    
        HStack(alignment: .top) {
            VStack(alignment: .center) {
                Spacer(minLength: 0)
                Text("About").font(.system(size: 40)).multilineTextAlignment(.center)
                SwiftUIGIFPlayerView(gifName: "Gif/logo")
                    .frame(width: 200.0, height: 200.0)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .padding(.bottom)
                Text("Poke Pokedex").font(.system(size:30)).multilineTextAlignment(.center).padding(.bottom)
                Text("Information about Evolutionary Pokemon").font(.system(size: 20)).multilineTextAlignment(.center).padding(.bottom)
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "envelope")
                        Text("Contact email for Feedback")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 5.0)
                    HStack {
                        Image(systemName: "c.circle")
                        Text("Copyright by Liam Ha")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 5.0)
                    HStack {
                        Image(systemName: "arrow.2.circlepath")
                        Text("Current version 1.0")
                            .multilineTextAlignment(.center)
                    }
                    .padding(.bottom, 5.0)
                }
                Spacer(minLength: 0)
                Spacer(minLength: 0)
            }
        }
    }
}

