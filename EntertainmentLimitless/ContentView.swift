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
            MovieView(searchText: "", movieList: MovieList(page: nil, results: nil))
                        .tabItem {
                            Label("Movies", systemImage: "film")
                        }

                    SeriesView(serieList: SeriesList(page:nil, results: nil))
                        .tabItem {
                            Label("Series", systemImage: "tv.fill")
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

