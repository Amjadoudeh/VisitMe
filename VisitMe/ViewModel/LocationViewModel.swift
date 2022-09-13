import SwiftUI
import MapKit

class LocationViewModel: ObservableObject {
    @Published var locations: [Location]
    @Published var mapLocation: Location {
        didSet {
            updateLocation(location: mapLocation)
        }
    }
    
    
    //MARK: showing the current location on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        
        self.mapLocation = locations.first!
        self.updateLocation(location: locations.first!)
    }
    
    //MARK: showing list of locations
    @Published private(set) var showLocationsList: Bool = false
    
    //MARK: showing the Details via sheet
    @Published var showSheetLocationDetails: Location? = nil
    
    //MARK: Update the Location
    private func updateLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
        }
    }
    
    //MARK: Toggle the Location List
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    //MARK: Show next Location
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    //MARK: NextLocationButtonPressed
    func nextButtonPressed() {
        // get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else { return }
        
        //Check of the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            guard let firstLocation = locations.first else { return }
            showNextLocation(location: firstLocation)
            return
            
        }
        // Next index is valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }

}
