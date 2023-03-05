//
//  StateBootmcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 5/3/23.
//

import SwiftUI

// @State Property telling the view to watch this state of this varibale
// If the @State Property variable changes watched view automatically update the view
// Adding the @State Property View always watch the value.


struct StateBootmcamp: View {
    
    @State var counterValue:Int = 0
    
    var body: some View {
        ZStack{
            VStack{
                
                Text("\(counterValue)")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                
                HStack{
                    Button("Increment + "){
                        counterValue += 1
                    }
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.green)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Button("Decrement -"){
                        counterValue -= 1
                    }
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

struct StateBootmcamp_Previews: PreviewProvider {
    static var previews: some View {
        StateBootmcamp()
    }
}
