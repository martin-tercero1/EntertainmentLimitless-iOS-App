//
//  SearchMovieView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 12/4/22.
//

import SwiftUI

struct SearchMovieView: View {
    @State var searchText: String
    @State private var isEditing = false
    
    @State var movieSearchList: MovieSearch
    @State var moviesSearchResults : [MovieSearchResults]?
    
    var body: some View {
        movieSearchCard
    }
}

struct SearchMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieView(searchText: "", movieSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
    }
}

extension SearchMovieView {
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
                                Divider()
                                VStack {
                                    let x = Double(movie.vote_average ?? 0).rounded(toPlaces: 2)
                                    Text("Rating: \(String(x))")
                                        .font(.subheadline)
                                    Divider()
                                    Text(movie.release_date ?? "Date not found")
                                        .font(.footnote)
                                }
                            }
                        }.padding()
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
                        .padding()
                        Divider()
                    }
                }
            }
        }
        .padding(.top)
    }
}
