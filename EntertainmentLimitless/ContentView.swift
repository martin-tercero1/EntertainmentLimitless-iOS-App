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
            
        SearchView()
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            
        GenresView(MgenreList: Genres(genres: nil), SgenreList: Genres(genres: nil))
            .tabItem {
                Label("Genres", systemImage: "list.star")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

