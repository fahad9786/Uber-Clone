//
//  UberMapViewRepersentable.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-20.
//

import SwiftUI
import MapKit



struct UberMapViewRepresentable:  UIViewRepresentable{
    let mapView = MKMapView()
    let locationManager = LocationManager()
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let selectedLocation = locationViewModel.selectedLocation{
            print("DEBUG: Selected location in map view is\(selectedLocation)")
        }
    }
    
    // gets sent as the coordinator
    func makeCoordinator() -> MapCoordinator{
        return MapCoordinator(parent: self)
    }
}

    
    extension UberMapViewRepresentable{
        
        class MapCoordinator: NSObject, MKMapViewDelegate{
            let parent: UberMapViewRepresentable
            
            init(parent: UberMapViewRepresentable){
                self.parent = parent
                super.init()
            }
            
            func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
                let region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
                )
                
                parent.mapView.setRegion(region, animated: true)
                
            }
        }
    }

