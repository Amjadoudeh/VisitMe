import SwiftUI
import MapKit

struct LocationViewDetails: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                imageSection
                
                VStack(alignment: .leading, spacing: 16.0) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            closeButton
        }
    }
}

struct LocationViewDetails_Previews: PreviewProvider {
    static var previews: some View {
        LocationViewDetails(location: LocationsDataService.locations.first!)
            .environmentObject(LocationViewModel())
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
        .shadow(color: .black.opacity(0.5), radius: 10)
    }
    
    var titleSection: some View {
        VStack(alignment: .leading, spacing: 8.0) {
            Text(location.name)
                .font(.largeTitle.weight(.semibold))
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    
    var descriptionSection: some View {
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
    
    var mapLayer: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: locationViewModel.mapSpan)),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 15)
            }
        }
            .allowsHitTesting(false)
            .aspectRatio(1, contentMode: .fit)
            .cornerRadius(15)
    }
    
    var closeButton: some View {
        Button {
            
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
