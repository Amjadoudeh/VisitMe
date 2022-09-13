import SwiftUI
import MapKit

class LocationModelView: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateLocation(location: mapLocation)
        }
    }
    
    
    // showing the current location on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        self.mapLocation = locations.first!
        self.updateLocation(location: locations.first!)
    }
    
    // showing list of locations
    @Published private(set) var showLocationsList: Bool = false
    
    private func updateLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
   func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
}
