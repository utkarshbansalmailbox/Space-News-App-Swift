//
//  APIclient.swift
//  NewsApp
//
//  Created by UTKARSH BANSAL on 10/04/23.
//

// The code is importing the Foundation framework, which provides fundamental data types, protocols,
// and functions for Apple platforms. The code also defines a struct `SpaceData` that conforms to the
// `Codable` and `Identifiable` protocols, and a class `SpaceAPI` that conforms to the
// `ObservableObject` protocol. The `SpaceAPI` class has a function `getdata()` that fetches data from
// the Space Flight News API and updates the `news` property of the class with the fetched data. The
// `@MainActor` attribute is used to ensure that the updates to the `news` property are performed on
// the main thread.
// The `URLSession.shared.dataTask(with: url)` function is making an asynchronous network
// request to the specified URL. It takes a closure as a parameter that will be executed when
// the request completes. The closure receives three optional parameters: `data`, `response`,
// and `error`.

import Foundation


//api https://api.spaceflightnewsapi.net/v3/articles


struct SpaceData: Codable, Identifiable{
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
    
}
@MainActor class SpaceAPI: ObservableObject{
    @Published var news: [SpaceData] = []
    func getdata(){
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=25") else{return}
        
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data else{
                let temperror = error!.localizedDescription
                DispatchQueue.main.async{
                    self.news = [SpaceData(id: 0, title: "", url: "", imageUrl: "", newsSite: "", summary: "error, no internet", publishedAt: "")]
                }
                return
            }
            
            let spaceDate = try! JSONDecoder().decode([SpaceData].self, from: data)
            DispatchQueue.main.async {
                print("new data loaded, Success.  \nAtriclesLoaded: \(spaceDate.count)")
                self.news = spaceDate
            }
        }.resume()
        
    }
}

