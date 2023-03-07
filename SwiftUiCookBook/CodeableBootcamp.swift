//
//  CodeableBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 7/3/23.
//

import SwiftUI

// In Swift, Codable is a combination of Encodable and Decodable

// Encodable means an object is convertible from Swift to JSON (or to another external representation).

// Decodable means an object is convertible from JSON (or other external representation) to Swift.

struct CodeableBootcamp: View {
    @StateObject var viewModel = CodeableViewModel()
    var body: some View {
        
        Text(viewModel.customerModel?.name ?? "")
    }
}


class CodeableViewModel : ObservableObject{
    @Published var customerModel:CustomerModel? = nil
    
    init() {
        getData()
    }
    
    private func getData(){
        guard let jsonData = getJSONData() else {return}
        
        // Manually Covert JSON
        // It's very difficult to write this code manually it's takes lots of boilarplate code
        if
            let data = try? JSONSerialization.jsonObject(with: jsonData),
            let dictionary = data  as? [String:Any],
            let id = dictionary["id"] as? String,
            let name = dictionary["name"] as? String{
            
            customerModel = CustomerModel(id: id, name: name)
        }
    }
    
    // Prepare Fake Json Data
    private func getJSONData()->Data?{
        let dictionary:[String:Any] = [
            "id" : "12345",
            "name" : "Kamrul Hasan"
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: dictionary)
        return jsonData
    }
}

struct CustomerModel{
    let id:String
    let name:String
}


















struct CodeableBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        CodeableBootcamp()
    }
}
