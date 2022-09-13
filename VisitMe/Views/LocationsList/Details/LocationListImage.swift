import SwiftUI

struct LocationListImage: View {
    let location: Location
    var body: some View {
        Group {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
        }
    }
}
