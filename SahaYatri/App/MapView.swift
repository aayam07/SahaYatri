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
    // USING SWIFT CLOSURE TO PREPARE MAP REGION TO DISPLAY
        @State private var region: MKCoordinateRegion = {
            var mapCoordinates = CLLocationCoordinate2D(latitude: 27.625349, longitude: 85.556061)
            
            var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
            
            var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
            
            return mapRegion
        }()  // CLOSURE
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var locationManager = CLLocationManager()
    
    //MARK: - FUNCTIONS
    func requestForDeviceLocation() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    //MARK: - BODY
    var body: some View {
        
        //MARK: - MAP WITH ANNOTATIONS (ADVANCED MAP)
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
             
                        MapAnnotation(coordinate: item.locationCoordinates, content: {
                            // SwiftUI view to display as an Annotation
                            Image(systemName: "pin.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32, alignment: .center)
                        })  //: ANNOTATION
            
        })  //: MAP
        
    }

            
    }


//MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
