//
//  MapView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    //MARK: - PROPERTIES
    
    // Location Manager Object
    @StateObject var locationManager = LocationManager()
    
    @State private var busSearchText: String = ""
    
    @State private var searchFieldIsAnimating: Bool = false
    
    // USING SWIFT CLOSURE TO PREPARE MAP REGION TO DISPLAY
        @State private var region: MKCoordinateRegion = {

            var mapCoordinates = CLLocationCoordinate2D(latitude: 27.7172, longitude: 85.3240)
            
            var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            
            var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
            
            return mapRegion
        }()  // CLOSURE
    
     let locations: [BusLocation] = Bundle.main.decode("buseslocation.json")
    
//    // test
//    let mayurLocations: [ChangingBusLocation] = Bundle.main.decode("changinglocations.json")
    
     var searchedLocations: [BusLocation] = []
    
//     FUNCTION
    mutating func matchLocationSearch() {

        for location in locations {
            if location.name.uppercased() == busSearchText.uppercased() {
                searchedLocations.append(location)

            }
        }

    }
    
    
    //MARK: - BODY
    var body: some View {

            //        //MARK: - MAP WITH ANNOTATIONS (ADVANCED MAP)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
                        
                        MapAnnotation(coordinate: item.locationCoordinates, content: {
                                        MapAnnotationView(location: item)
                                
                                    })

                    })  //: MAP
                    .overlay (
                        HStack {
                            TextField("Search Bus Name", text: $busSearchText)
                                .foregroundColor(.accentColor)
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .padding()
                                .background(
                                    Color(UIColor.tertiarySystemBackground)
                                )
                                .cornerRadius(10)
                                .padding()
                                
                            
                            Button {
                                // Some Action
//                                matchLocationSearch()
                            } label: {
                                Image(systemName: "bus")
                                    .foregroundColor(.black)
                                    .font(.title)
                            }
                            .padding(.trailing, 20)

                        }  //: HSTACK
                            .offset(y: searchFieldIsAnimating ? -300 : 0)
                        
                    )
                    .onAppear {
                        withAnimation(.spring()) {
                            searchFieldIsAnimating = true
                        }
                        
                    }
        
    }
        
    
    }


//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
