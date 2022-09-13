import SwiftUI

struct ImageSectionDetailsView: View {
    let location: Location
    var body: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) { Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        .shadow(color: .black.opacity(0.5), radius: 10)
    }
}
