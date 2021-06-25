//
//  ContentView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        UIKitTabView{
            ExplorerView().tab(title: "Explorer", image: "magnifyingglass.circle")
            
            MapV().tab(title: "Carte", image: "map")
            
            
            HistoriqueView().tab(title: "Historique", image: "line.horizontal.3")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
