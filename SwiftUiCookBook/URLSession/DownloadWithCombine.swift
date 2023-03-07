//
//  DownloadWithCombine.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 7/3/23.
//

import SwiftUI
import Combine

struct DownloadWithCombine: View {
    @StateObject var viewModel = DownloadWithCombineViewModel()

    var body: some View {
        List{
            ForEach(viewModel.posts) { post in
                Text(post.title)
            }
        }
    }
}


class DownloadWithCombineViewModel : ObservableObject{
    @Published var posts:[PostModel] = []
    var cancelables = Set<AnyCancellable>()
    
    init(){
        downloadPost()
    }
    
    private func downloadPost(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else{return}
        
        downloadData(url: url, decodingType: [PostModel].self) {[weak self] data in
            self?.posts = data
        }
        
    }
    
    private func downloadData<T:Codable>(url:URL, decodingType: T.Type, _ completion: @escaping (_ data:T)->()){
        //1. Create the publisher
        //2. Subscribe publisher on background theread
        //3. receive on main thread
        //4. Try map(check that the data is good)
        //5. Decode the data
        //6. sink (put the item in app)
        //7. Store or cancel subscription
        
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response)->Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode <= 299 else{
                    throw  URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: decodingType, decoder: JSONDecoder())
            .sink { error in
                print("Error: \(error)")
            } receiveValue: {data in
                completion(data)
            }
            .store(in: &cancelables)
    }
}

struct PostResponseModel:Identifiable,Codable{
    let userId:Int
    let id:Int
    let title:String
    let body:String
}


struct DownloadWithCombine_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithCombine()
    }
}
