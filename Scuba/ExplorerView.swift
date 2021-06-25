//
//  ExplorerView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI



struct ExplorerView: View {
    
    var body: some View {
//        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack{
                    
                    
                    ExtractedViewFaune(listeEspece: DataEspece.faune, nomEspece: "Faune", color: Color.colorFaune)
                    
                    ExtractedViewFlore(listeEspece: DataEspece.flore, nomEspece: "Flore")

                    ExtractedViewVestige(listeEspece: DataEspece.vestige, nomEspece: "Vestige")

                    ExtractedViewParcours(listeEspece: DataEspece.parcours, nomEspece: "Parcours")

                }
            }
            
//        }
        
    }
}



struct ExtractedViewFaune: View {
    var listeEspece: [Espece]
    var nomEspece: String
    var color : Color
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            
            Text(nomEspece)
                .foregroundColor(Color.colorFaune)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5);
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: 10) {
                    ForEach(listeEspece) { espece in
                        
                        NavigationLink(
                            destination: DetailView(espece: espece),
                            label: {
                                VStack {
                                    Image(espece.pic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(8.0)
                                    
                                    Text(espece.title)
                                        .foregroundColor(Color.black)
                                        .font(.subheadline)
                                }
                            })
                        
                        
                    }
                    .padding(.leading, 10.0)
                }
                
            }
            .frame(height: 185)
        }
        .navigationBarTitle("Explorer")
        
    }
}

struct ExtractedViewFlore: View {
    var listeEspece: [Espece]
    var nomEspece: String
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            
            Text(nomEspece)
                .foregroundColor(Color.colorFlore)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5);
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: 10) {
                    ForEach(listeEspece) { espece in
                        
                        NavigationLink(
                            destination: DetailView(espece: espece),
                            label: {
                                VStack {
                                    Image(espece.pic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(8.0)
                                    
                                    Text(espece.title)
                                        .foregroundColor(Color.black)
                                        .font(.subheadline)
                                }
                            })
                        
                        
                    }
                    .padding(.leading, 10.0)
                }
                
            }
            .frame(height: 185)
        }
        .navigationBarTitle("Explorer")
        
    }
}

struct ExtractedViewVestige: View {
    var listeEspece: [Espece]
    var nomEspece: String
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            
            Text(nomEspece)
                .foregroundColor(Color.colorVestige)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5);
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: 10) {
                    ForEach(listeEspece) { espece in
                        
                        NavigationLink(
                            destination: DetailView(espece: espece),
                            label: {
                                VStack {
                                    Image(espece.pic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(8.0)
                                    
                                    Text(espece.title)
                                        .foregroundColor(Color.black)
                                        .font(.subheadline)
                                }
                            })
                        
                        
                    }
                    .padding(.leading, 10.0)
                }
                
            }
            .frame(height: 185)
        }
        .navigationBarTitle("Explorer")
        
    }
}

struct ExtractedViewParcours: View {
    var listeEspece: [Espece]
    var nomEspece: String
    var body: some View {
        
        VStack(alignment: .leading) {
            
            
            
            Text(nomEspece)
                .foregroundColor(Color.colorParcours)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5);
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(alignment: .top, spacing: 10) {
                    ForEach(listeEspece) { espece in
                        
                        NavigationLink(
                            destination: DetailView(espece: espece),
                            label: {
                                VStack {
                                    Image(espece.pic)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(8.0)
                                    
                                    Text(espece.title)
                                        .foregroundColor(Color.black)
                                        .font(.subheadline)
                                }
                            })
                        
                        
                    }
                    .padding(.leading, 10.0)
                }
                
            }
            .frame(height: 185)
        }
        .navigationBarTitle("Explorer")
        
    }
}

struct explorer_Previews: PreviewProvider {
    static var previews: some View {
        ExplorerView()
    }
}
