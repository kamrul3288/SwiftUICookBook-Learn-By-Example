//
//  ButtonBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 9/3/23.
//

import SwiftUI

struct ButtonBootcamp: View {
    var body: some View {
        VStack{
            Button("Button"){
                
            }
            
            Button(action: {}){
                Text("Button")
                .frame(maxWidth: Double.infinity,minHeight: 40)
                   
            }
            .foregroundColor(Color.white)
            .background(Color.red)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.bottom,10)
            
            Button(action: {}){
                Circle()
                    .frame(width: 75,height: 75)
                    .foregroundColor(.green)
                    .overlay(
                        Image(systemName: "heart.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    )
            }
            .padding(.bottom,10)
            
            Button(action: {}){
                Label("Love", systemImage: "heart.fill")
                    .frame(maxWidth: Double.infinity,minHeight: 40)
            }
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.bottom,10)
            
            Button(action: {}){
                HStack{
                    Text("Love")
                    Image(systemName: "heart.fill")
                }.frame(maxWidth: Double.infinity,minHeight: 40)
            }
            .foregroundColor(Color.white)
            .background(Color.indigo)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding(.bottom,10)
            
            Button(action: {}){
                Text("Button")
                .frame(maxWidth: Double.infinity,minHeight: 40)
                .foregroundColor(.black)
            }
            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.red,lineWidth: 2.0))
            .shadow(radius: 5)
            .padding(.bottom,10)
           
            
            
        }.padding()
    }
}

struct ButtonBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ButtonBootcamp()
    }
}
