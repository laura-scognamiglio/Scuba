//
//  DetailView.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 11/11/2020.
//

import SwiftUI

struct DetailView: View {
    
    
    
    
    @State private var tailleDouble = false
    @State private var detailSegmented : DetailElement = .description
    var espece : Espece
    var btnShare : some View { Button(action: {
        let av = UIActivityViewController(activityItems: [espece.title], applicationActivities: nil)
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }) {
        Image(systemName: "square.and.arrow.up")
            .foregroundColor(Color.colorFaune)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        
    }
    }
    var body: some View {
        
        
        
        
        
        VStack {
            
            Image(espece.pic)
                .resizable()
                .cornerRadius(3.0)
                .padding(.horizontal)
                .aspectRatio(contentMode: .fit)
                .frame(width: tailleDouble ? 600 : 410 )
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.tailleDouble.toggle()
                        
                    }
                }
            
            
            Picker("", selection: $detailSegmented, content: {
                ForEach(DetailElement.allCases, id :  \.self)
                {element in Text(element.rawValue).tag(element)
                    
                    
                }
            })
            .padding(.all)
            .pickerStyle(SegmentedPickerStyle())
            
            
            switch detailSegmented {
            case .description :
                VStack {

                    ScrollView{

                        Text(espece.desc)
                            .padding([.top, .leading, .trailing])
                    }

                }
            case .avis :
            AVIS()
            case .localisation :
                VStack(alignment: .leading)  {

                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.colorFaune)

                        Text(espece.lieu)
                        Spacer()

                    }
                    HStack {
                        Image(systemName: "location.viewfinder")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.colorFaune)

                        Text("Longitude: \(espece.longitude)\nLatitude: \(espece.latitude)")

                    }
                    HStack {
                        Image(systemName: "map")
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.colorFaune)

                        Text("Ouvrir dans \(Image(systemName: "applelogo")) Plans")

                    }
                }
            }
            Spacer()
        }

        .navigationBarItems(trailing: btnShare)
        .accentColor(Color.colorFaune)
        .navigationBarTitle(espece.title)



    }
}

