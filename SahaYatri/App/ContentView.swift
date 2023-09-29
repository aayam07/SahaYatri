//
//  ContentView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Location")
                }
            
            NewLocationView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Current")
                }
        }  //: TAB VIEW
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
