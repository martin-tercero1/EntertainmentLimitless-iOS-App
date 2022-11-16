//
//  MovieView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct MovieView: View {
    @State var movie: MovieList
    
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
                
                movie = decodeResponse
                
                
            } catch {
                print ("error", error)
            }
        }
        
        return HStack {
            let movieURL = "https://image.tmdb.org/t/p/w500" + (movie.results?[0].poster_path ?? "poster")
            
            AsyncImage(url: URL(string: movieURL)) {
                image in image.resizable()
            }  placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 290)
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
            
            VStack {
                Text(movie.results?[0].title ?? "Title")
                HStack {
                    Text("\(movie.results?[0].vote_average ?? 0)")
                    Spacer()
                    Text(movie.results?[0].release_date ?? "Release Date")
                }
                
                Button("Read more") {

                }
            }
        }.padding()
    }
        
}

struct MovieList: Codable {
    var page: Int?
    var results: [Movie]?
}
struct Movie: Codable {
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
    var popularity: Float?
    var release_date: String?
    var video: Bool?
    var vote_average: Float?
    var vote_count: Int?
    
    
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movie: MovieList(page:nil, results: nil))
    }
}

