//
//  MovieView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct SearchView: View {  
    @State var showingDetailSearchMovies = false
    @State var showingDetailSearchSeries = false
    
    var body: some View {
        VStack{
        Button(action: {
                    self.showingDetailSearchMovies.toggle()
        }) {
                    Text("Search for movies")
        }.sheet(isPresented: $showingDetailSearchMovies) {
            SearchMovieView(searchText: "", movieSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
        }
        Divider()
        Button(action: {
                    self.showingDetailSearchSeries.toggle()
                }) {
                    Text("Search for tv series")
                }.sheet(isPresented: $showingDetailSearchSeries) {
                    SearchSeriesView(searchText: "", seriesSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
                }
        }
        }
    }

struct MovieSearch: Codable {
    var page: Int?
    var results: [MovieSearchResults]?
    var total_results: Int?
    var total_pages: Int?
}
        
struct MovieSearchResults: Codable, Hashable {
    var poster_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    var genre_ids: [Int]?
    var id: Int?
    var original_title: String?
    var original_language: String?
    var title: String?
    var backdrop_path: String?
    var popularity: Double?
    var vote_count: Int?
    var video: Bool?
    var vote_average: Double?
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

