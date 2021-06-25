//
//  MapView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI
import MapKit
import CoreLocation
import UIKit

struct MapV: View {
    
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State var selectedEspeceAnnotation: Annotation?
    @State var isActive: Bool = false
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.568125, longitude: 7.016552), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//    var ffvp = ["Tous" ,"Faune", "Flore", "Vestige", "Parcours"]
    @State var sCFFVP = Type.tous
    @State var especes: [Annotation] = DataEspece.especes.map{Annotation(espece: $0)}

    
    var body: some View {
        NavigationView {
            ZStack {
                MapScuba(selectedEspeceAnnotation: $selectedEspeceAnnotation, isActive: $isActive, annotations: especes.filter{sCFFVP == .tous ? true : $0.type == sCFFVP })
                    
                    .sheet(item: $selectedEspeceAnnotation, onDismiss: {
                        print("On Dismiss !!")
                    }) { especeAnnotation in
                        
                        DetailView(espece: especeAnnotation.espece)
                            .navigationBarItems(leading: Button(action: {selectedEspeceAnnotation = nil}, label: {Text("Cancel")}))
                    }
                VStack{
                    Spacer()
                    
                    Picker(selection: $sCFFVP, label: Text("")) {
                        ForEach(Type.allCases, id: \.self) { index in
                            Text(index.rawValue).tag(index)
                                
                            
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                }
            }
            .navigationBarItems(leading: NavigationLink(destination: ListView(), label: {Image(systemName: "list.bullet.rectangle")}))
            .navigationBarTitle("", displayMode: .inline)
            
            
        }
    }
}


