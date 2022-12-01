////
////  Draft.swift
////  EntertainmentLimitless
////
////  Created by Duilio Rosciano on 11/30/22.
////
//
//import SwiftUI
//
//struct Draft: View {
//    var body: some View {
//        //@State var movieSearchList: MovieSearch
//        //@State var moviesSearchResults : [MovieSearchResults]?
//        //
//        //Task {
//        //do {
//        //    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/search/movie?api_key=8f5542b6988efb226030efa69a3226e7&language=en-US&query=avengers&page=1&include_adult=false")!)
//        //
//        //    let decodeResponse = try JSONDecoder().decode(MovieSearch.self, from: data)
//        //
//        //    movieSearchList = decodeResponse
//        //
//        //    moviesSearchResults = movieSearchList.results
//        //
//        //
//        //} catch {
//        //    print ("error", error)
//        //    }
//        //}
//        //return VStack {
//        //    NavigationView {
//        //        ScrollView {
//        //            VStack {
//        //                ForEach(moviesSearchResults ?? [], id: \.self) { movie in
//        //                    HStack {
//        //                        let movieURL = "https://image.tmdb.org/t/p/w500" + (movie.poster_path ?? "poster")
//        //
//        //                        AsyncImage(url: URL(string: movieURL)) {
//        //                            image in image.resizable()
//        //                        }  placeholder: {
//        //                            ProgressView()
//        //                        }
//        //                        .frame(width: 200, height: 290)
//        //                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
//        //
//        //                        VStack {
//        //                            Text(movie.title ?? "Title")
//        //                            HStack {
//        //                                Text("\(movie.vote_average ?? 0)")
//        //                                Spacer()
//        //                                Text(movie.release_date?[0..<4] ?? "Release Date")
//        //                            }
//        //
//        //                            Button("Read more") {
//        //                                // if else display just read more
//        //                            }
//        //                        }
//        //                    }.padding()
//        //                }
//        //            }
//        //        }
//        //    }
//        //    .searchable(text: $searchText, placement: .navigationBarDrawer)
//        //}
//        //
//        //
//        //struct MovieSearch: Codable {
//        //    var page: Int?
//        //    var results: [MovieSearchResults]?
//        //    var total_results: Int?
//        //    var total_pages: Int?
//        //}
//        //
//        //struct MovieSearchResults: Codable, Hashable {
//        //    var poster_path: String?
//        //    var adult: Bool?
//        //    var overview: String?
//        //    var release_date: String?
//        //    var genre_ids: [Int]?
//        //    var id: Int?
//        //    var original_title: String?
//        //    var original_language: String?
//        //    var title: String?
//        //    var backdrop_path: String?
//        //    var popularity: Double?
//        //    var vote_count: Int?
//        //    var video: Bool?
//        //    var vote_average: Double?
//        //}
//        //
//        //struct MovieView_Previews: PreviewProvider {
//        //    static var previews: some View {
//        //        MovieView(searchText: "", movieList: MovieList(page:nil, results: nil), movieSearchList: MovieSearch(page: nil, results: nil, total_results: nil, total_pages: nil))
//        //        //movieSearchList: MovieSearch(page:nil, results: nil, total_results: nil, total_pages: nil)
//        //    }
//        //}
//    }
//}
//
//struct Draft_Previews: PreviewProvider {
//    static var previews: some View {
//        Draft()
//    }
//}
