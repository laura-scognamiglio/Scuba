//
//  AVIS.swift
//  Scuba
//
//  Created by Lyes BOUKBOUKA on 24/03/2021.
//

import SwiftUI

struct AVIS: View {
    var body: some View {
        VStack (alignment: .trailing){

            ZStack {
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 350, height: 150)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .opacity(0.6)

                VStack {
                    HStack {
                        Text("Laura S")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(60.0)
                        Spacer()

                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                    }
                    .padding(.horizontal,35)
                    Text("J'ai pu découvrir plein d'especes et vestiges grâce à Scuba!")
                        .frame(width: 350.0, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.leading)
                }

            }

            Image(systemName: "plus.bubble")
                .frame(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.colorFaune)
        }
    }
}

struct AVIS_Previews: PreviewProvider {
    static var previews: some View {
        AVIS()
    }
}
