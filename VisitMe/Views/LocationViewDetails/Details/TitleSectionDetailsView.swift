import SwiftUI

struct TitleSectionDetailsView: View {
    let location: Location

    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(location.name)
                .font(.largeTitle.weight(.semibold))
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
}
