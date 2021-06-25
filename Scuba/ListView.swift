//
//  ListView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI

struct ListView: View {
    @State private var searchText: String = ""
    @State private var hideSearchBar: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var favoritesOnly = false
    @State private var sCFFV = "Faune"
   var ffv = ["Faune", "Flore", "Vestige"]
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
    
        }
    }
    

   var pickerView: some View {
    
        Picker(selection: $sCFFV, label: Text("")) {
            ForEach(ffv, id: \.self) { index in
                Text(index).tag(index)
            }
        }.pickerStyle(SegmentedPickerStyle())
        .padding([.horizontal,.top], 20)
      
    }
    
    var listView: some View {
        VStack{
            HStack{
        SearchBar(text: $searchText, placeholder: "Especes, Vestige, Parcours...")
            .frame(width: hideSearchBar ? 0 : 380, height: hideSearchBar ? 0 : 50)
                
            }
            List(self.searchText.isEmpty ? DataEspece.especes.filter{espece in espece.type.rawValue == sCFFV }: DataEspece.especes.filter{
                    $0.title.lowercased().contains(self.searchText.lowercased()) } ){ item in
            NavigationLink(
                destination: DetailView(espece: item),
                label: {
                    ExctractedEspeceView(item: item)
                })
        }
     .listStyle(InsetListStyle())
        }
        
    }
    
    
    
    var body : some View {
        
            VStack {
                
                pickerView
                
                listView
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(false)
            .navigationBarItems(leading: btnBack)
            .navigationBarItems(trailing: Button(action: {hideSearchBar.toggle()}, label: {Image(systemName: "magnifyingglass")}))
        
    }
}
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
