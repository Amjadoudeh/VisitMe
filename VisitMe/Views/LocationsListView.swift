import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var locationViewModel: LocationModelView
    
    var body: some View {
        List {
            ForEach(locationViewModel.locations) {
                location in
                Button {
                    locationViewModel.showNextLocation(location: location)
                } label: {
                    LocationsListViewRow(location: location)
                }
                .padding(.vertical,4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(PlainListStyle())
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationModelView())
    }
}
