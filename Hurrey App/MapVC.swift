//
//  MapVC.swift
//  Hurrey App
//
//  Created by Sumit Bangarwa on 15/07/20.
//  Copyright © 2020 Sumit Bangarwa. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {

    @IBOutlet var googleMap: GMSMapView!
    
    var lat = Double()
    var long = Double()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleMap.delegate = self
        
        let roundedLat = Double(lat).rounded(toPlaces: 6)
        let roundedLong = Double(long).rounded(toPlaces: 6)
        print("MAP",roundedLat, roundedLong)
        
        let locCamera = GMSCameraPosition.camera(withLatitude: roundedLat , longitude: roundedLong, zoom: 10)
        googleMap.camera = locCamera
        
        showMarker(position: googleMap.camera.target)
        
    }

    
    func showMarker(position : CLLocationCoordinate2D) {
        let marker = GMSMarker()
        marker.position = position
        marker.title = "Delhi"
        marker.snippet = "Capital of delhi"
        marker.map = googleMap
    }

  

}

extension MapVC: GMSMapViewDelegate {
    
}
