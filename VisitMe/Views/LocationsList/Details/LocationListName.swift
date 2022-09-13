import SwiftUI

struct LocationListName: View {
    let location: Location

    var body: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
