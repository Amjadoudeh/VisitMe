import SwiftUI

struct LocationViewDetails: View {
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationViewDetails(location: LocationsDataService.locations.first!)
    }
}

extension LocationViewDetails {
    var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
    }
}
