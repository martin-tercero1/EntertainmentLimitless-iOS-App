//
//  MovieView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String
    @State private var isEditing = false
    
    @State var movieSearchList: MovieSearch
    @State var moviesSearchResults : [MovieSearchResults]?
    
    var body: some View {
        movieSearchCard
        }
    }

extension SearchView {
    var movieSearchCard: some View {
        
        VStack {
            HStack {
                TextField("Search...", text: $searchText)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color.gray)
                    .cornerRadius(8)
                    .padding(.horizontal,10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .onSubmit {
                                Task {
                                do {
                                    let query: String = searchText
                                    
                                    var components = URLComponents()
                                    components.scheme = "https"
                                    components.host = "api.themoviedb.org"
                                    components.path = "/3/search/movie"
                                    components.queryItems = [
                                        URLQueryItem(name: "api_key", value: "8f5542b6988efb226030efa69a3226e7"),
                                        URLQueryItem(name: "query", value: query)
                                    ]
                                    
                                    let url = components.url
                                    let (data, _) = try await URLSession.shared.data(from: url!)
                                
                                    let decodeResponse = try JSONDecoder().decode(MovieSearch.self, from: data)
                                
                                    movieSearchList = decodeResponse
                                
                                    moviesSearchResults = movieSearchList.results
                                
                                
                                } catch {
                                    print ("error", error)
                                    }
                                }
                    }
                if isEditing {
                    Button (action: {
                        self.isEditing = false
                        self.searchText = ""
                    }) {
                        Text ("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                }
            }

            ScrollView {
                VStack (alignment: .leading){
                    ForEach(moviesSearchResults ?? [], id: \.self) { movie in
                        HStack {
                            let movieURL = "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "poster")
                            
                            AsyncImage(url: URL(string: movieURL)) {
                                image in image.resizable()
                            }  placeholder: {
                                ProgressView()
                            }
                            .frame(width: 200, height: 290)
                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                            
                            
                            VStack {
                                Text(movie.title ?? "Title")
                                HStack {
                                    let x = Double(movie.vote_average ?? 0).rounded(toPlaces: 2)
                                    Text("\(String(x))")
                                    
                                    Text(movie.release_date?[0..<4] ?? "Release Date")
                                }
                                
                                Collapsible(
                                    label: {Text("Read more")},
                                    content: {
                                        HStack {
                                            Text("\(movie.overview ?? "OverView")")
                                            Spacer()
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(Color.white)
                                    }
                                )
                                .frame(maxWidth: .infinity)
                            }
                        }.padding()
                    }
                }
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
        SearchView(searchText: "", movieSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
    }
}

