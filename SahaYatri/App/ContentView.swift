//
//  ContentView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                StartView()
            } else {
                LogInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
