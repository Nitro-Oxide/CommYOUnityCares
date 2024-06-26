//
//  CommunityMapView.swift
//  commYOUnityCares
//
//  Created by Javon Carlyle Thomas on 3/29/24.
//

import SwiftUI
import MapKit
import CoreLocation

struct CommunityMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875),
        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
    )
    @State private var selectedPlace: Place?
    
    var cameraPosition: MapCameraPosition {
        MapCameraPosition.region(region)
    }
    
    let places: [Place] = [
        Place(name: "Prairie View A&M University", coordinate: CLLocationCoordinate2D(latitude: 30.0954, longitude: -95.9875)),
        Place(name: "Community Center 1",coordinate: CLLocationCoordinate2D(latitude: 30.0820, longitude: -95.9774)),
        Place(name: "Community Center 2", coordinate: CLLocationCoordinate2D(latitude: 30.0854, longitude: -95.9796)),
        // Add more community centers as needed
    ]
    
    var body: some View {
        Spacer()
        VStack {
            Map(position: .constant(cameraPosition)) {
                ForEach(places) { place in
                    Marker(place.name, coordinate: place.coordinate)
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            List {
                ForEach(places) { place in
                    Text(place.name)
                        .padding()
                        .background(selectedPlace == place ? Color.blue.opacity(0.5) : Color.clear)
                        .cornerRadius(8)
                        .onTapGesture {
                            selectedPlace = place
                            moveToSelectedPlace()
                        }
                }
            }
            Spacer()
        }
    }
    
    private func moveToSelectedPlace() {
        if let selectedPlace = selectedPlace {
            withAnimation {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: selectedPlace.coordinate.latitude, longitude: selectedPlace.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                )
            }
        }
    }
}

struct Place: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    
    static func == (lhs: Place, rhs: Place) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }}

#Preview {
    CommunityMapView()
}
