//
//  GovVehicles.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 01/10/2023.
//

import Foundation
import MapKit

struct GovVehicles: Codable, Identifiable {
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
