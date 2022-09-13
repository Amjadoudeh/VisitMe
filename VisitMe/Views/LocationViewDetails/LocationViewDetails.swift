import SwiftUI

struct LocationViewDetails: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let location: Location

    var body: some View {
        ScrollView {
            VStack {
                ImageSectionDetailsView(location: location)
                VStack(alignment: .leading, spacing: 16.0) {
                    TitleSectionView(location: location)
                    Divider()
                    DescriptionSectionDetailsView(location: location)
                    Divider()
                    StaticMapLayerDetailsView(location: location)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
          CloseButtonDetailsView(location: location)
        }
    }
}

struct LocationViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationViewDetails(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
    }
}
