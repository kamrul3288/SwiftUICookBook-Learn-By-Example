//
//  WeakSelfBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 6/3/23.
//

import SwiftUI


// In Swift, [weak self] prevents closures from causing memory leaks in your application.

// This is because when you use [weak self], you tell the compiler to create a weak reference to self.

// If you use [self] or strong reference then closures will alive until the task finish. If that time user navigate another screen then new object created every time.

struct WeakSelfBootcamp: View {
    @AppStorage("count") var count:Int?
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: WeakSelfSecondScreen()) {
                Text("View your todays quote")
            }
        }
        .overlay(
            Text("Object Count: \(count ?? 0)")
                .padding()
                .background(Color.red)
                .foregroundColor(Color.white)
                .fontWeight(.heavy)
                .cornerRadius(20),
            alignment: Alignment.bottomTrailing
        ).padding()
    }
}


struct WeakSelfSecondScreen : View{
    @StateObject var viewModel = WeakSelfSecondViewModel()
    var body: some View{
        if viewModel.loading {
            ProgressView()
        }else {
            Text(viewModel.quote)
                .navigationTitle("Todays Quote")
                .font(.system(size: 40))
                .fontWeight(.heavy)
                .padding()
        }
    }
}

class WeakSelfSecondViewModel : ObservableObject{
    
    @Published var quote = ""
    @Published var loading = false
    
    init(){
        print("WeakSelfSecondViewModel: INITIALIZE")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount+1, forKey: "count")
        publishTodaysQuote()
    }
    
    // When object deinitialize
    deinit {
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount-1, forKey: "count")
        print("WeakSelfSecondViewModel: DE-INITIALIZE")
    }
    
    //  when we using this strong reference unitl the closure task complete the viewmodel keep alive that means if user move another screen this object instance keep in memmory
    private func publishTodaysQuote(){
        loading = true
      
//        DispatchQueue.main.asyncAfter(deadline: .now()+500){
//            self.loading = false
//            self.quote = "Any fool can write code that a computer can understand. Good programmers write                 code that humans can understand."
//        }
        
        //To resolve this problem need to use [weak self]
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0){[weak self] in
            self?.loading = false
            self?.quote = "Any fool can write code that a computer can understand. Good programmers write code that humans can understand."
        }
    }
}


struct WeakSelfBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        WeakSelfBootcamp()
    }
}
