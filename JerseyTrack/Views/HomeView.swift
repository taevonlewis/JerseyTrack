//
//  HomeView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI
import MapKit
import CoreLocation

struct HomeView: View {
    var body: some View {
        let startPosition: MapCameraPosition = MapCameraPosition.region(MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 40.217052, longitude: -74.742935), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        ))
        
        MapReader { _ in
            Map(initialPosition: startPosition)
        }
    }
}

#Preview {
    HomeView()
}
