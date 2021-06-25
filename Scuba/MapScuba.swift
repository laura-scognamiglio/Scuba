//
//  Map.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MapScuba: UIViewRepresentable {
    @Binding var selectedEspeceAnnotation: Annotation?
    @Binding var isActive: Bool
    
    
    var annotations: [Annotation]
    
    
    let mapView = MKMapView()
    let locationManager = CLLocationManager()
    
    func makeUIView(context: Context) -> MKMapView {
        
        // Configuration Location Manager
        
        locationManager.delegate = context.coordinator
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        mapView.addAnnotations(annotations)
        mapView.setCenter(annotations[0].coordinate, animated: true)
        mapView.showsUserLocation = true
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotations(annotations)
        uiView.setNeedsDisplay()
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(parent: self)
    }
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate, CLLocationManagerDelegate {
        var parent: MapScuba
        
        init(parent: MapScuba) {
            self.parent = parent
        }
        
        func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
            parent.selectedEspeceAnnotation = view.annotation as? Annotation
            parent.isActive = true
        }
        
        func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
            parent.selectedEspeceAnnotation = nil
            parent.isActive = false
            
            
        }
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            if (annotation is MKUserLocation) {
                return nil
            }
            let pin = MKAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            guard let annotation = annotation as? Annotation else { return nil }
            var pinImage: UIImage
            switch annotation.type {
            case .flore:
                pinImage = UIImage(named: "floreIcon")!
            case .vestige:
                pinImage = UIImage(named: "vestigeIcon")!
            case .parcours:
                pinImage = UIImage(named: "parcoursIcon")!
            default:
                pinImage = UIImage(named: "fauneIcon")!
            }
            
            let size = CGSize(width: 38, height: 38)
            UIGraphicsBeginImageContext(size)
            pinImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            
            pin.image = resizedImage
            return pin
        }
        /// Location Manager Delegate
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            print(locations)
        }
    }
}

