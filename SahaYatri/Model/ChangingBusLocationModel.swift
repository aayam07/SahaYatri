//
//  ChangingBusLocationModel.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 30/09/2023.
//

import Foundation
import MapKit

struct ChangingBusLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let coordinates: [Coordinates]
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}
