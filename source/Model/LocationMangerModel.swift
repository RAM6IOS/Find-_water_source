//
//  ViewModel.swift
//  source
//
//  Created by Bouchedoub Rmazi on 14/4/2022.
//


import Foundation
import SwiftUI
import MapKit
import CoreLocation



final class locationManger: NSObject, ObservableObject , CLLocationManagerDelegate {
    
    @Published  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50.5534960 ,longitude: 3.102955), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let locationManger =  CLLocationManager()
    override init() {
        super.init()
        locationManger.delegate = self
    }
    
    func requesAllowOnceLocationPermission(){
        
        locationManger.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else{
            return
        }
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(center: latestLocation.coordinate , span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03))
        }
    }
    
    func locationManager(_ manager:CLLocationManager , didFailWithError erroe:Error){
        print(erroe.localizedDescription)
        
    }
    
}


