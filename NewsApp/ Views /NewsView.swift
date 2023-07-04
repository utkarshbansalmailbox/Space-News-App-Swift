//
//  NewsView.swift
//  NewsApp
//
//  Created by UTKARSH BANSAL on 16/04/23.
//

// This code defines a SwiftUI view called `NewsView` that displays a list of news articles. It uses
// the `@EnvironmentObject` property wrapper to access an instance of the `SpaceAPI` class, which
// provides the news data. It also uses the `@Environment` property wrapper to access the `openURL`
// function, which is used to open the URL of a news article when it is tapped. The `body` property of
// the view returns a `List` that displays each news article using a `ForEach` loop. Each news article
// is displayed using a custom view called `NewsAtricle`, and when a news article is tapped, the
// `openURL` function is called to open the URL of the article. The `refreshable` modifier is used to
// enable pull-to-refresh functionality, which calls the `getdata` method of the `SpaceAPI` class to
// fetch the latest news data. The `NewsView_Previews` struct provides a preview of the `NewsView`
// view.

import SwiftUI

struct NewsView: View {
    
    @EnvironmentObject var data: SpaceAPI
    @Environment(\.openURL) var openURL
    
    private var textWidth = 100
    
    
    var body: some View {
        List{
            ForEach(data.news){
                news in NewsAtricle(title: news.title, imageUrl: news.imageUrl, siteName: news.newsSite, summary: news.summary)
                onTapGesture {
                    openURL(URL(string: news.url)!)
                }
            }
        }
        .refreshable {
            data.getdata()
        }
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
            .environmentObject(SpaceAPI())
    }
}
