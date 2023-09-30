//
//  HomeView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Home")
                }
            
            LocationView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Location")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
