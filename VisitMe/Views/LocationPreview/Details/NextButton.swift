import SwiftUI

struct NextButton: View {
    @EnvironmentObject var locationViewModel: LocationViewModel

    var body: some View {
        Button {
            locationViewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}
