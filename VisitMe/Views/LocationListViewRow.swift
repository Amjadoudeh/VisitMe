import SwiftUI
import MapKit

struct LocationsListViewRow: View {
    @State var location = Location(name: "Roma",
                                   cityName: "Roma",
                                   coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
                                   description: "",
                                   imageNames: ["rome-colosseum-1"],
                                   link: "")
    var body: some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            
            names
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
    var names: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.headline)
            Text(location.cityName)
                .font(.subheadline)
        }
    }
}

struct LocationsListViewRow_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListViewRow()
    }
}
