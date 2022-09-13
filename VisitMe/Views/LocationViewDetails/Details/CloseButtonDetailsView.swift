import SwiftUI

struct CloseButtonDetailsView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let location: Location

    var body: some View {
        Button {
            locationViewModel.showSheetLocationDetails = nil
        }label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.ultraThickMaterial)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
        }
    }
}
