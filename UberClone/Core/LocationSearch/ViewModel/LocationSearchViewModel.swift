//  LocationSearchViewModel.swift
//  UberClone
//
//  Created by Fahad Sheikh on 2024-01-23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    
    // MARK: - Properties
    
    // Init as a blank array, and this fills in the rest
    @Published var results = [MKLocalSearchCompletion]()
    // There is no selected location, so init as null
    @Published var selectedLocation: String?
    // The object
    private let searchCompleter: MKLocalSearchCompleter
    
    // Use didSet for queryFragment to update searchCompleter.queryFragment when queryFragment changes
    @Published var queryFragment: String = "" {
        didSet {
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    // MARK: - Lifecycle
    
    override init() {
        // Initialize searchCompleter before super.init()
        searchCompleter = MKLocalSearchCompleter()
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    // MARK: - Helpers
    
    // You can remove this function if you're not using it, or implement its functionality
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        // Implement the functionality for selecting a location
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            guard let item = response?.mapItems.first else{ return }
            let coordinate = item.placemark.coordinate
            
            print("DEBUG: Location coordinate \(coordinate)")
        }
        
    }
    
    // helper function
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping (MKLocalSearch.CompletionHandler)) {
        // MKlocalsearch gives no coordinate only gives addres string
        let searchRequest = MKLocalSearch.Request()
        // gets the full adress of the location not displayed
        searchRequest.naturalLanguageQuery  = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchRequest)
        
        search.start(completionHandler:     completion)
        
    }
}

// MARK: - MKLocalSearchCompleterDelegate
extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        // Most recent search completion
        self.results = completer.results
    }
}

