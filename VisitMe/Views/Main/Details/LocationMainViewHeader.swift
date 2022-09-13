import SwiftUI

struct LocationMainViewHeader: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let maxWidthForIpad: CGFloat = 700

    var body: some View {
        VStack {
            Button(action: locationViewModel.toggleLocationsList) {
                Text(locationViewModel.mapLocation.name + " - " + locationViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationViewModel.mapLocation)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down"  )
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationViewModel.showLocationsList ? 180 : 0))
                    })
            }
            if locationViewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 15, style: .continuous)
        )
        .shadow(color: .black.opacity(0.4), radius: 15, x: 5, y: 15)
        .padding()
        .frame(maxWidth: maxWidthForIpad)
    }
}
