//
//  ContentView.swift
//  NewsApp
//
//  Created by UTKARSH BANSAL on 16/04/23.
//

// This code is defining the main view of a news app in SwiftUI. It imports the SwiftUI framework,
// defines a struct called `ContentView` that conforms to the `View` protocol, and contains a
// `@StateObject` property called `data` that is an instance of a custom class called `SpaceAPI`. It
// also contains a `@State` property called `opac` that is initialized to 0.0.
import SwiftUI

struct ContentView: View {
    
    @StateObject var data = SpaceAPI()
    @State private var opac = 0.0
    
    
    var body: some View {
        NavigationView{
            VStack{
                NewsView()
                    .opacity(opac)
                
            }
            .navigationTitle("AstroChronicle")
            .navigationTitle("A Space News App")
            .foregroundColor(.gray)
            .environmentObject(data)
            .onAppear{
                data.getdata()
                withAnimation(){
                    opac = 0.99
                }
            }
          
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
