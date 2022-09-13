import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16) {
                ImageSectionView(location: location)
                TitleSectionView(location: location)
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
            
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y:65)
        )
        .cornerRadius(10)
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
}

extension LocationPreviewView {
    var learnMoreButton: some View {
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.borderedProminent)
        
    }
    var nextButton: some View {
        Button {
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        }
        .buttonStyle(.bordered)
    }
}