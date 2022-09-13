import SwiftUI
import MapKit

struct LocationMainViewMap: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel

    var body: some View {
        Map(coordinateRegion: $locationViewModel.mapRegion,
            annotationItems: locationViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(locationViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 15)
                    .onTapGesture {
                        locationViewModel.showNextLocation(location: location)
                    }
            }
        }
        )
        .ignoresSafeArea()
    }
}

struct LocationMainViewMap_Previews: PreviewProvider {
    static var previews: some View {
        LocationMainViewMap()
            .environmentObject(LocationViewModel())
    }
}
