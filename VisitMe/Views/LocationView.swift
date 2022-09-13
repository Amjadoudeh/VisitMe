import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationViewModel
    let maxWidthForIpad: CGFloat = 700
    var body: some View {
        ZStack {
            //MARK: Map view
            mapLayer
                .ignoresSafeArea()
            
            //MARK: list View
            VStack(spacing: 0) {
                header
                    .padding()
                    .frame(maxWidth: maxWidthForIpad)
                Spacer()
                locationPerviewStack
            }
        }
        .sheet(item: $locationViewModel.showSheetLocationDetails, onDismiss: nil) { location in
            LocationViewDetails(location: location)
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationViewModel())
    }
}

//MARK: View Extension

extension LocationView {
    
    private var header: some View {
        VStack {
            Button(action: locationViewModel.toggleLocationsList) {
                Text(locationViewModel.mapLocation.name + " - " + locationViewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: locationViewModel.mapLocation)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down"  )
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: locationViewModel.showLocationsList ? 180 : 0))
                    })
            }
            if locationViewModel.showLocationsList {
                LocationsListView()
            }
        }
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 15, style: .continuous)
        )
        .shadow(color: .black.opacity(0.4), radius: 15, x: 5, y: 15)
    }
    
    var mapLayer: some View {
        Map(coordinateRegion: $locationViewModel.mapRegion,
            annotationItems: locationViewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(locationViewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 15)
                    .onTapGesture {
                        locationViewModel.showNextLocation(location: location)
                    }
                
            }
        }
        )
    }
    
    var locationPerviewStack: some View {
        //MARK: Location Preview View
        ZStack {
            ForEach(locationViewModel.locations) { location in
                if locationViewModel.mapLocation == location {
                    LocationPreviewView(location: location)
                        .padding()
                        .frame(maxWidth: maxWidthForIpad)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
