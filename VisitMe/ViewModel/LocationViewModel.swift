import Foundation

class LocationModelView: ObservableObject {
    @Published var locations: [Location]
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
