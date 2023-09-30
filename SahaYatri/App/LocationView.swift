//
//  LocationView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI
import CoreLocation

struct LocationView: View {
    @StateObject var locationManager = LocationManager()
    
    @AppStorage("onBoarding") var isOnboardingViewActive: Bool = false

       var body: some View {
           VStack {
               Text(locationManager.location != nil ? "\(locationManager.location!.coordinate.latitude), \(locationManager.location!.coordinate.longitude)" : "Loading...")
               
               Button {
                   // ACTION
                   isOnboardingViewActive = true
               } label: {
                   Text("Button")
               }
           }
          

       }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
