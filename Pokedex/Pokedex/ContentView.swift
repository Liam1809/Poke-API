//
//  ContentView.swift
//  Poke
//
//  Created by Liam on 29/03/2021.
//

import SwiftUI
import SSSwiftUIGIFView


 struct ContentView: View {
    @AppStorage("currentScreen") var currentScreen = 1
     var body: some View {
        if(currentScreen > 1) {
                NavigationView {
                    CustomNavigation()
                      .navigationTitle("")
                        .navigationBarTitleDisplayMode(.inline)
                      .navigationBarHidden(true)
                   }
        } else {
            Onboarding()
        }
    }
}
 
 
