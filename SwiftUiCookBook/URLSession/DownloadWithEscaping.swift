//
//  DownloadWithEscapingBootcamp.swift
//  SwiftUiCookBook
//
//  Created by Kamrul Hasan on 7/3/23.
//

import SwiftUI

struct DownloadWithEscaping: View {
    @StateObject var viewModel = DownloadWithEscapingViewModel()
    var body: some View {
        List{
            ForEach(viewModel.posts) { post in
                Text(post.title)
            }
        }
    }
}


class DownloadWithEscapingViewModel : ObservableObject{
    @Published var posts:[PostModel] = []
    
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
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else{
                print("Error: NO_DATA")
                return
            }
            
            guard error == nil else{
                print("Error: \(String(describing: error))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else{
                print("Error: Invalid Response")
                return
            }
            
            guard response.statusCode >= 200 && response.statusCode <= 299 else{
                print("Error: \(response.statusCode) Invalid Response Code")
                return
            }
            
    
            guard let dowlnloadPost = try? JSONDecoder().decode(decodingType.self, from: data) else{
                print("Error: Decoding")
                return
            }
            
            DispatchQueue.main.async {
                completion(dowlnloadPost)
            }
        }.resume()
    }
}

struct PostModel:Identifiable,Codable{
    let userId:Int
    let id:Int
    let title:String
    let body:String
}

struct DownloadWithEscaping_Previews: PreviewProvider {
    static var previews: some View {
        DownloadWithEscaping()
    }
}
