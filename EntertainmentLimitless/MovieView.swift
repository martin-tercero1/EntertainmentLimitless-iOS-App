//
//  MovieView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct MovieView: View {
    @State var searchText: String
    @State private var isEditing = false
    
    @State var movieList: MovieList
    @State var movies : [Movie]?
    
    var body: some View {
        movieCard
        }
    }

extension MovieView {
    var movieCard: some View {
        
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=8f5542b6988efb226030efa69a3226e7")!)
                
                let decodeResponse = try JSONDecoder().decode(MovieList.self, from: data)
                
                movieList = decodeResponse
                
                movies = movieList.results
                
            } catch {
                print ("error", error)
            }
        }
        
        return VStack {
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
                        self.searchText = "submitted"
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
//            NavigationView {
//                Text("")
//                    .searchable(text: $searchText, prompt: "Enter your Movie or TV Series")
//                    .navigationTitle("Entertainment Limiltess")
//            }
            ScrollView {
                VStack {
                    ForEach(movies ?? [], id: \.self) { movie in
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
                                    Text("\(movie.vote_average ?? 0)")
                                    Spacer()
                                    Text(movie.release_date?[0..<4] ?? "Release Date")
                                }
                                
                                Button("Read more") {
                                    // if else display just read more
                                }
                            }
                        }.padding()
                    }
                }
            }
        }
    }
}

struct MovieList: Codable {
    var page: Int?
    var results: [Movie]?
}
struct Movie: Codable, Hashable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var title: String?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var poster_path: String?
    var media_type: String?
    var genre_ids: [Int]?
    var popularity: Double?
    var release_date: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(searchText: "", movieList: MovieList(page:nil, results: nil))
    }
}

