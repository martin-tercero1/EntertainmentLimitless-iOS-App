//
//  ContentView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieView(movieList: MovieList(page: nil, results: nil))
                        .tabItem {
                            Label("Movies", systemImage: "film")
                        }

                    SeriesView(serie: SeriesList(page:nil, results: nil))
                        .tabItem {
                            Label("Series", systemImage: "tv.fill")
                        }
            
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

