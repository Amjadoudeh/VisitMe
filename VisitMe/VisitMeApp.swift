import SwiftUI

@main
struct VisitMeApp: App {
    @StateObject private var locationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
           LocationView()
                .environmentObject(locationViewModel)
        }
    }
}
