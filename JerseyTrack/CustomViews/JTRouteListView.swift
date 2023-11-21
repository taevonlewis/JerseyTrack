//
//  JTRouteListView.swift
//  JerseyTrack
//
//  Copyright © 2023 TaeVon Lewis. All rights reserved.
//


import SwiftUI

struct JTRouteListView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        ForEach(1..<21) { index in
                            Text("Route \(index)")
                                .padding()
                        }
                    }
                    .frame(width: .infinity)
                    Spacer()
                }
            }
            .scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .background(.white)
        .cornerRadius(5)
    }
}

#Preview {
    JTRouteListView()
}
