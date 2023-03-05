//
//  EnvironmentObjectBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 5/3/23.
//

import SwiftUI

// @EnvironmentObject A property wrapper type for an observable object supplied by a parent or ancestor view.

// @EnvironmentObject helps to send value in child value without pass value directly

// @EnvironmentObject value will available all child view

class EnvironmentObjectViewModel : ObservableObject{
    @Published var counter = 0
    
    func increment(){
        counter += 1
    }
    
    func decrement(){
        counter -= 1
    }
}

struct EnvironmentObjectBootcamp: View {
    
    @StateObject var viewModel = EnvironmentObjectViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button("Increment+"){
                        viewModel.increment()
                    }
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    
                    Button("Decrement-"){
                        viewModel.decrement()
                    }
                    .foregroundColor(Color.white)
                    .fontWeight(.heavy)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
                }.padding(.bottom, 30)
                
                
                NavigationLink(destination: EnvironmentObjectDetails()) {
                    Text("Show Counter Count")
                }
            }
            
            .navigationTitle("Counter View")
        }
        
        // adding the magic here
        .environmentObject(viewModel)
    }
}


struct EnvironmentObjectDetails : View{
    
    @EnvironmentObject var viewModel:EnvironmentObjectViewModel
    
    var body: some View{
        VStack{
            Text("\(viewModel.counter)")
                .font(.system(size: 100))
                .fontWeight(.heavy)
        }
    }
}


struct EnvironmentObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectBootcamp()
    }
}
