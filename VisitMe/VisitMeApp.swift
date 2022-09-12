import SwiftUI

@main
struct VisitMeApp: App {
    @StateObject private var locationViewModel = LocationModelView()
    
    var body: some Scene {
        WindowGroup {
           LocationView()
                .environmentObject(locationViewModel)
        }
    }
}
