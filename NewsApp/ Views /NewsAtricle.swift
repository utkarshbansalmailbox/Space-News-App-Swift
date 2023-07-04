//
//  NewsAtricle.swift
//  NewsApp
//
//  Created by UTKARSH BANSAL on 16/04/23.
//

// This code defines a SwiftUI view called `NewsAtricle` that displays a news article with a title,
// image, site name, and summary. It uses the `CachedAsyncImage` library to asynchronously load and
// display the image from the given `imageUrl`. The `VStack` and `HStack` are used to arrange the
// different components of the view. The `PreviewProvider` is used to provide a preview of the view in
// Xcode's canvas.

import SwiftUI
import CachedAsyncImage

struct NewsAtricle: View {
    var title: String
    var imageUrl: String
    var siteName: String
    var summary: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(siteName)
                .foregroundColor(.blue)
                .italic()
            HStack(alignment: .center){
                CachedAsyncImage(url: URL(string: imageUrl), transaction: Transaction(animation: .easeInOut)){
                    phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    else {
                        HStack{
//                            placeholder
//                            ProgressView()
                        }
                    }
                }
            }
            
            Text(title)
                .font(.headline)
                .bold()
                .padding(10)
            Text(summary)
                .lineLimit(10)
                .font(.body)
                .padding(8)
        }
    }
}

struct NewsAtricle_Previews: PreviewProvider {
    static var previews: some View {
        NewsAtricle(title: "title", imageUrl: "imageurl", siteName: "sitename", summary: "summary")
    }
}
