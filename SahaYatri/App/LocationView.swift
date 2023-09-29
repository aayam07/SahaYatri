////
////  LocationView.swift
////  SahaYatri
////
////  Created by Aayam Adhikari on 29/09/2023.
////
//
//import SwiftUI
//
//struct LocationView: View {
//    @ObservedObject private var locationManager = LocationManager()
//
//    var body: some View {
//        VStack {
//                    if let location = locationManager.currentLocation {
//                        Text("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
//                    } else {
//                        Text("Fetching location...")
//                    }
//
//                    Button(action: {
//                        locationManager.requestLocation()
//                    }) {
//                        Text("Get Location")
//                    }
//                }
//                .padding()
//    }
//}
//
//struct LocationView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationView()
//    }
//}
