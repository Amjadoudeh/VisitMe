//
//  LocationsListView.swift
//  VisitMe
//
//  Created by Amjad Oudeh on 12.09.22.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var locationViewModel: LocationModelView
    
    var body: some View {
        List {
            ForEach(locationViewModel.locations) {
                location in
                HStack {
                    if let imageName = location.imageNames.first {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 45, height: 45)
                            .cornerRadius(10)
                    }
                    
                    VStack(alignment: .leading) {
                        Text(location.name)
                            .font(.headline)
                        Text(location.cityName)
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
        }
    }
}

struct LocationsListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsListView()
            .environmentObject(LocationModelView())
    }
}
