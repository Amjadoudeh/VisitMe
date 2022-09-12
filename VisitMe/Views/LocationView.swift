import SwiftUI


class LocationModelView: ObservableObject {
    @Published var locations: [Location]
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationModelView
    
    var body: some View {
        List {
            ForEach(locationViewModel.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}
