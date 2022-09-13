import SwiftUI

struct LearnMoreButton: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    let location: Location
    var body: some View {
        Button {
            locationViewModel.showSheetLocationDetails = location
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
}
