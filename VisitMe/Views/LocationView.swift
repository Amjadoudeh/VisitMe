import SwiftUI
import MapKit


struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationModelView
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationModelView())
    }
}
