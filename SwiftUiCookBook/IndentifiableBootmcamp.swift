//
//  IndentifiableBootmcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 6/3/23.
//

import SwiftUI

// In Swift, Codable is a combination of Encodable and Decodable

// Encodable means an object is convertible from Swift to JSON (or to another external representation).

// Decodable means an object is convertible from JSON (or other external representation) to Swift.

// Identifiable provides a default implementation for class types (using ObjectIdentifier ), which is only guaranteed to remain unique for the lifetime of an object

struct Person:Identifiable{
    let id:String = UUID().uuidString
    let name:String
    let age:Int
}

struct IndentifiableBootmcamp: View {
    @State var persons:[Person] = []
   
    
    var body: some View {
        VStack{
           
            List{
                ForEach(persons) { person in
                    Text(person.name)
                }
                .onDelete(perform: remove)
            }
            
            Button("Add Random Person"){
                persons.append(Person(name: "Kamrul Hasan", age: 28))
            }
            .foregroundColor(Color.white)
            .fontWeight(.bold)
            .padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    
        }
    }
    
    func remove(at offset:IndexSet){
        persons.remove(atOffsets: offset)
    }
}

struct IndentifiableBootmcamp_Previews: PreviewProvider {
    static var previews: some View {
        IndentifiableBootmcamp()
    }
}
