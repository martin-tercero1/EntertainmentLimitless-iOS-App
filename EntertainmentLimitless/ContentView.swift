//
//  ContentView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
        MovieView(movieList: MovieList(page:nil, results: nil))
            .tabItem {
                Label("Movies", systemImage: "film")
            }

        SeriesView(serieList: SeriesList(page:nil, results: nil))
            .tabItem {
                Label("Series", systemImage: "tv.fill")
            }
            
        SearchView(searchText: "", movieSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
        GenresView(genreList: Genres(genres: nil))
            .tabItem {
                Label("Genres", systemImage: "play.square.stack.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

