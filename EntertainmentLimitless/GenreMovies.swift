//
//  GenreMovies.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 12/4/22.
//

import SwiftUI

struct GenreMovies: View {
    @State var MgenreId: Int
    
    @State var GmovieList: MovieList
    @State var Gmovies : [Movie]?
    
    var body: some View {
        mGenreCard
        }
}

extension GenreMovies {
    var mGenreCard: some View {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=8f5542b6988efb226030efa69a3226e7&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_genres=\(MgenreId)&with_watch_monetization_types=flatrate")!)

                let decodeResponse = try JSONDecoder().decode(MovieList.self, from: data)

                GmovieList = decodeResponse

                Gmovies = GmovieList.results

            } catch {
                print ("error", error)
            }
        }
        return VStack {
            ScrollView {
                VStack (alignment: .leading){
                    ForEach(Gmovies ?? [], id: \.self) { movie in
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
                                    .frame(width: 100.0)
                                HStack {
                                    let x = Double(movie.vote_average ?? 0).rounded(toPlaces: 2)
                                    Text("\(String(x))")
                                    
                                    Text(movie.release_date?[0..<4] ?? "Release Date")
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
        }
    }

struct GenreMovies_Previews: PreviewProvider {
    static var previews: some View {
        GenreMovies(MgenreId: 28, GmovieList: MovieList(page:nil, results: nil))
    }
}
