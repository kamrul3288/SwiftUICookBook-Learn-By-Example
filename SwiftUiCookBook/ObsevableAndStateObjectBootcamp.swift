//
//  ObsevableAndStateObjectBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 5/3/23.
//

import SwiftUI

struct Country : Identifiable{
    let id: Int
    let name:String
}


//  @ObservableObject A type of object with a publisher that emits before the object has changed.

//  @ObservedObject property wrappers tell a SwiftUI view to update in response to changes from an observed object.

//  @StateObject property wrappers tell a SwiftUI view to update in response to changes from an observed object.

//  @Published notify the @ObservableObject when data chnages and then @ObservableObject notify the @ObservedObject. and then @ObservedObject notify the View

// @ObservableObject can reinitialized value when view recreated that means it lost previous value

// @StateObject can survive when view recreated and use in parent view @StateObject and child view use @ObservedObject

class ObsevableAndStateObjectViewModel : ObservableObject{
    @Published var countryList:[Country] = []
    @Published var isLoading:Bool = false
    
    init(){
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.isLoading = false
            self.prepareCountryList()
        }
        
    }
    
    private func prepareCountryList(){
        countryList.append(Country(id: 1, name: "Bangladesh"))
        countryList.append(Country(id: 2, name: "India"))
        countryList.append(Country(id: 3, name: "Nepal"))
        countryList.append(Country(id: 4, name: "Bhutan"))
        countryList.append(Country(id: 5, name: "Maldiv"))
    }
    
    func delete(index:IndexSet){
        countryList.remove(atOffsets: index)
    }
}


struct ObsevableAndStateObjectBootcamp: View {
    
    @StateObject var viewModel = ObsevableAndStateObjectViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                if(viewModel.isLoading){
                    ProgressView()
                }

                else {
                    List{
                        ForEach(viewModel.countryList){country in
                            HStack{
                                Text("\(country.id)")
                                    .padding()
                                    .foregroundColor(Color.white)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                
                                Text(country.name)
                            }
                        }
                        .onDelete(perform: viewModel.delete)
                    }
                }
            }
            .navigationTitle("Country List")
            .navigationBarItems(
                trailing: NavigationLink(destination:ObsevableAndStateObjectDetails(viewModel: viewModel), label: {
                    Text("Next Screen")
                })
            )
        }
    }
}

struct ObsevableAndStateObjectDetails : View{
    @ObservedObject var viewModel:ObsevableAndStateObjectViewModel
    var body: some View{
        VStack{
            ForEach(viewModel.countryList){country in
                Text(country.name)
            }
        }
    }
}



struct ObsevableAndStateObjectBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        ObsevableAndStateObjectBootcamp()
    }
}
