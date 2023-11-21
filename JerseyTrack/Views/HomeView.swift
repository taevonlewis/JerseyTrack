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
    @State private var position: MapCameraPosition = .userLocation(followsHeading: true, fallback: .automatic)
    @State private var isSheetPresented: Bool = true
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Map(position: $position)
            
            ZStack(alignment: .bottomTrailing) {
                Button(action: {
                    
                }, label: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .padding(5)
                        .background(.white)
                        .clipShape(Circle())
                })
                Image(systemName: "gearshape")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .background(.gray)
                    .clipShape(Circle())
                }
            }
        .mapControls {
            MapCompass()
            MapUserLocationButton()
            MapPitchToggle()
        }
        .onAppear {
            CLLocationManager().requestWhenInUseAuthorization()
        }
    }
}

#Preview {
    HomeView()
}
