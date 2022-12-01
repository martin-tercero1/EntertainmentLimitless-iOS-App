//
//  GenresView.swift
//  EntertainmentLimitless
//
//  Created by Martin Tercero on 11/29/22.
//

import SwiftUI

struct GenresView: View {
    
    @State var genreList: Genres
    @State var genres: [GenreInfo]?
    
    var body: some View {
        genreCard
    }
}
    
    extension GenresView {
        var genreCard: some View {
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=8f5542b6988efb226030efa69a3226e7")!)
                    
                    let decodeResponse = try JSONDecoder().decode(Genres.self, from: data)
                    
                    genreList = decodeResponse
                    
                    genres = genreList.genres
                    
                } catch {
                    print ("error", error)
                }
            }
            return NavigationView {
                ScrollView {
                    ForEach(genres ?? [], id: \.self) { genre in
                        Collapsible(
                            label: {Text("\(genre.name ?? "name")")},
                            content: {
                                HStack {
                                    Text("\(genre.id ?? 0)")
                                    Spacer()
                                }
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                            }
                        )
                    }
//                    Collapsible(
//                        label: {Text("Movies")},
//                        content: {
//                            ForEach(genres ?? [], id: \.self) { genre in
//                                Collapsible(
//                                    label: {Text("\(genre.name ?? "name")")},
//                                    content: {
//                                        HStack {
//                                            Text("\(genre.id ?? 0)")
//                                            Spacer()
//                                        }
//                                        .frame(maxWidth: .infinity)
//                                        .padding()
//                                        .background(Color.white)
//                                    }
//                                )
//                            }
//                        }
//                    )
                    
                }
                
            }
        }
    }


struct Genres: Codable {
    var genres: [GenreInfo]?
}
struct GenreInfo: Codable, Hashable {
    var id: Int?
    var name: String?
}

struct GenresView_Previews: PreviewProvider {
    static var previews: some View {
        GenresView(genreList: Genres(genres: nil))
    }
}
