import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel

    var body: some View {
        ZStack {
            // MARK: Map view
            LocationMainViewMap()

            // MARK: list View

            VStack(spacing: 0) {
                LocationMainViewHeader()
                Spacer()
                LocationMainViewPerviewStack()
            }
        }
        .sheet(item: $locationViewModel.showSheetLocationDetails, onDismiss: nil) { location in
            LocationViewDetails(location: location)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}
