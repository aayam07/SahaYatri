//
//  LocationManagerExtension.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import Foundation
import CoreLocation

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}
