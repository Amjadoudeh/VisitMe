import SwiftUI

struct LocationMainViewPerviewStack: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let maxWidthForIpad: CGFloat = 700

    var body: some View {
        ZStack {
            ForEach(locationViewModel.locations) { location in
                if locationViewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}

struct LocationMainViewPerviewStack_Previews: PreviewProvider {
    static var previews: some View {
        LocationMainViewPerviewStack()
    }
}
