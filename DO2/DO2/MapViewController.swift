//
//  MapViewController.swift
//  DO2
//
//  Created by 江柏毅 on 2023/3/14.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    private var mapView: GMSMapView!

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        showMarker(position: CLLocationCoordinate2D(latitude: 23.6978, longitude: 120.9605))
        mapView.delegate = self
    }

    override func loadView() {
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.6978, longitude: 120.9605, zoom: 8.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "MapStyle", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        self.view = mapView
        self.mapView = mapView
    }

    func showMarker(position: CLLocationCoordinate2D){
            let marker = GMSMarker()
            marker.position = position
            marker.title = "你渴望"
            marker.snippet = "吉戰力嗎？"
            marker.map = mapView
        }
}

extension MapViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("wow")
    }

    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
        print("wowowow")
    }

    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
        let markViewModel = MapMarkerViewModel(title: marker.title, subtitle: marker.snippet, image: "Dog")
        let view = MapMarkerView(frame: .init(x: 0, y: 0, width: 200, height: 100), markViewModel)
        return view
    }
}
