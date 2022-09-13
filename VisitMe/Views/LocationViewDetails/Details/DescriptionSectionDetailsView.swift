import SwiftUI

struct DescriptionSectionDetailsView: View {
    let location: Location
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
            if let url = URL(string: location.link) {
                Link("Read more in Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
}
