//
//  ExctractedList.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 10/11/2020.
//

import SwiftUI

struct ExctractedEspeceView: View {
    var item: Espece
    
    var body: some View {
        
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
            if item.fav == true {
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            if item.fav == false{
                Spacer()
                Image(systemName: "star")
                    .foregroundColor(.yellow)
            }
        }
    }
}

