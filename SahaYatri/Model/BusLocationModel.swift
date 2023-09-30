//
//  BusLocationModel.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import Foundation
import MapKit

struct BusLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // Computed Property
    var locationCoordinates: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
