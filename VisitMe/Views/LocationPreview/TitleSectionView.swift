import SwiftUI

struct TitleSectionView: View {
    let location: Location
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(location.name)
                .font(.title3.bold())
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
