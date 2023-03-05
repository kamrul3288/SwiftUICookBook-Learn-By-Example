//
//  BindingBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 5/3/23.
//

import SwiftUI


// A @Binding in SwiftUI is a connection between a @State value
// And a Child View that display and changes it
// @Binding property can change parent @State value from Child View

struct BindingBootcamp: View {
    
    @State var ceounterValue:Int = 0
    
    var body: some View {
        VStack{
            Text("\(ceounterValue)")
                .font(.system(size: 60))
                .fontWeight(.heavy)
            
            BindingCounterButtonView(counterValue: $ceounterValue)
            
        }
    }
}

struct BindingCounterButtonView : View{
    
    @Binding var counterValue:Int
    
    var body: some View{
        HStack{
            Button("Increment+"){
                counterValue += 1
            }
            .foregroundColor(Color.white)
            .fontWeight(.heavy)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            
            Button("Decrement-"){
                counterValue -= 1
            }
            .foregroundColor(Color.white)
            .fontWeight(.heavy)
            .padding()
            .background(Color.red)
            .cornerRadius(10)
        }
    }
}




struct BindingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        BindingBootcamp()
    }
}
