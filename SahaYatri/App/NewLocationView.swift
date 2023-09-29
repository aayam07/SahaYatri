//
//  NewLocationView.swift
//  SahaYatri
//
//  Created by Aayam Adhikari on 29/09/2023.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?

    override init() {
        super.init()

        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
}

struct NewLocationView: View {
    @StateObject var locationManager = LocationManager()

       var body: some View {
           Text(locationManager.location != nil ? "\(locationManager.location!.coordinate.latitude), \(locationManager.location!.coordinate.longitude)" : "Loading...")
       }
}

struct NewLocationView_Previews: PreviewProvider {
    static var previews: some View {
        NewLocationView()
    }
}
