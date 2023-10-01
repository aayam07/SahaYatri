//
//  HomeView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    //MARK: - BODY
    var body: some View {
        TabView {
            MapView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Home")
                }
            
            UserDetailView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }

//            LocationView()
//                .tabItem {
//                    Image(systemName: "square.grid.2x2")
//                    Text("Location")
//                }
//
            
//                }
        } //: TAB
        
//        MapView()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
