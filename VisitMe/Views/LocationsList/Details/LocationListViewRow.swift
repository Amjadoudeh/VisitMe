import SwiftUI
import MapKit

struct LocationsListViewRow: View {
    let location: Location
    var body: some View {
        HStack {
            LocationListImage(location: location)
            LocationListName(location: location)
        }
    }
}
