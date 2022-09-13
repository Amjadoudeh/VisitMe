import SwiftUI
import MapKit

struct LocationView: View {
    @EnvironmentObject private var locationViewModel: LocationModelView
    
    var body: some View {
        ZStack {
            //MARK: Map view
            Map(coordinateRegion: $locationViewModel.mapRegion)
                .ignoresSafeArea()
            
            //MARK: list View
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
            } 
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationModelView())
    }
}

//MARK: View Extension

extension LocationView {
    
    private var header: some View {
        VStack {
            Text(locationViewModel.mapLocation.name + " , " + locationViewModel.mapLocation.cityName)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(alignment: .leading, content: {
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                })
            
            LocationsListView()
        }
        .background(.ultraThinMaterial,in: RoundedRectangle(cornerRadius: 15, style: .continuous)
        )
        .shadow(color: .black.opacity(0.4), radius: 15, x: 5, y: 15)
    }
}
