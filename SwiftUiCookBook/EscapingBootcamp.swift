//
//  EscapingBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 6/3/23.
//

import SwiftUI

// An escaping closure is a closure that's called after the function it was passed to returns.

// A non-escaping closure is a closure that's called within the function it was passed into,before it returns

struct EscapingBootcamp: View {
    @StateObject var viewModel = EscapingViewModel()
    
    var body: some View {
        NavigationStack{
            VStack{
                if(viewModel.loading){
                    ProgressView()
                }else{
                    Text("\(viewModel.luckeyNumber)")
                        .font(.system(size: 100))
                        .fontWeight(.heavy)
                    
                    Button("Generate Your Lucky Number"){
                        viewModel.generate()
                    }
                }
            }
            .navigationTitle("Guess The Number")
        }
    }
}

class EscapingViewModel : ObservableObject{
    @Published var luckeyNumber = 0
    @Published var loading = false
    
    
    func generate(){
        loading = true
        downloadAndGenerateNumber {[weak self] generatedNumber in
            if let self = self{
                self.loading = false
                self.luckeyNumber = generatedNumber
            }
            
        }
    }
    
    private func downloadAndGenerateNumber(_ completion: @escaping (Int)->() ){
        //non async closer doesn't need @escaping annotation
        DispatchQueue.main.asyncAfter(deadline: .now()+3){
            let randomInt = Int.random(in: 100..<900)
            completion(randomInt)
        }
    }
}


struct EscapingBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        EscapingBootcamp()
    }
}
