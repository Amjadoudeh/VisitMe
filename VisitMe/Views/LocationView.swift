import SwiftUI

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
            .environmentObject(LocationModelView())
    }
}
