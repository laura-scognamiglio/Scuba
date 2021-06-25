//
//  AnnotationView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI
import MapKit
import CoreLocation

class Annotation: NSObject, MKAnnotation, Identifiable {
    var id = UUID()
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var type: Type
    var espece: Espece
    
    init(espece: Espece) {
        self.espece = espece
        self.title = espece.title
        self.subtitle = espece.subTitle
        self.type = espece.type
        self.coordinate = CLLocationCoordinate2D(latitude: espece.latitude, longitude: espece.longitude)
    }
    
}

struct AnnotationView: View {
    @Binding var selectedEspeceAnnotation: Annotation?
    
    var body: some View {
        VStack {
            Text(selectedEspeceAnnotation?.title ?? "")
                .font(.largeTitle)
            Text(selectedEspeceAnnotation?.subtitle ?? "")
                .font(.headline)
                .foregroundColor(.red)
        }
    }
}


