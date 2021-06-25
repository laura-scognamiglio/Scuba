//
//  HisoriqueView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI


struct HistoriqueView: View {
    @State private var favoritesOnly = false
    @State private var sCFFVP = "Faune"
    var ffvp = ["Faune", "Flore", "Vestige", "Parcours"]
    
    var especes = DataEspece.especes
    
    
    var body : some View {
        
        NavigationView {
            
            VStack {
                Picker(selection: $sCFFVP, label: Text("")) {
                    ForEach(ffvp, id: \.self) { index in
                        Text(index).tag(index)
                        
                    }
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                Toggle(isOn: $favoritesOnly)
                {
                    Text("Favoris")
                        .fontWeight(.medium)
                        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.colorFaune)
                }
                List(especes.filter{espece in espece.type == Type(rawValue: sCFFVP) && (favoritesOnly ?  espece.fav : true) })
                { item in
                    NavigationLink(
                        destination: DetailView(espece: item),
                        label: {
                            HStack(alignment: .center, spacing: 5.0){
                                Image( "\(item.pic)")
                                    .resizable()
                                    .frame(width: 90.0, height: 70.0)
                                    .scaledToFit()
                                    .cornerRadius(3.0)
                                
                                
                                VStack(alignment: .leading, spacing: 0.0){
                                    Text("\(item.title)")
                                        .font(.title3)
                                        .multilineTextAlignment(.leading)
                                    
                                    
                                    Text("\(item.subTitle)")
                                        .fontWeight(.light)
                                        .foregroundColor(Color.colorFaune)
                                        .font(.headline)
                                        .font(.system(size: 20))
                                    
                                }
                                .padding()
                                if item.fav  {
                                    Spacer()
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    
                                    
                                } else {
                                    Spacer()
                                    Image(systemName: "star")
                                        .foregroundColor(.yellow)
                                }
                            }
                        })
                }
                .listStyle(InsetListStyle())
            }
            .navigationTitle("Historique")

        }
        
    }
    
    
}


//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoriqueView()
//    }
//}
