//
//  GenresView.swift
//  EntertainmentLimitless
//
//  Created by Martin Tercero on 11/29/22.
//

import SwiftUI

struct GenresView: View {
    
    @State var MgenreList: Genres
    @State var Mgenres: [GenreInfo]?
    
    @State var SgenreList: Genres
    @State var Sgenres: [GenreInfo]?
    
    @State var showingDetailSeries = false
    @State var showingDetailMovies = false
    
    @State var MgenreId: Int = 28
    @State var SgenreId: Int = 10759
    
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
                    
                    MgenreList = decodeResponse
                    
                    Mgenres = MgenreList.genres
                    
                } catch {
                    print ("error", error)
                }
            }
            
            Task {
                do {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/genre/tv/list?api_key=8f5542b6988efb226030efa69a3226e7")!)
                    
                    let decodeResponse = try JSONDecoder().decode(Genres.self, from: data)
                    
                    SgenreList = decodeResponse
                    
                    Sgenres = SgenreList.genres
                    
                } catch {
                    print ("error", error)
                }
            }
            
            
            
            return ScrollView {
                Text("Movies")
                VStack (alignment: .leading) {
                    ForEach(Mgenres ?? [], id: \.self) { genre in
                        Button(action: {
                                    MgenreId = genre.id!
                                    self.showingDetailMovies.toggle()
                                }) {
                                    Text("\(genre.name ?? "name")")
                                }.sheet(isPresented: $showingDetailMovies) {
                                    GenreMovies(MgenreId: MgenreId, GmovieList: MovieList(page:nil, results: nil))
                                }
                        Divider()
                    }
                }
                Text("Series")
                VStack (alignment: .leading) {
                    ForEach(Sgenres ?? [], id: \.self) { genre in
                        Button(action: {
                                    SgenreId = genre.id!
                                    self.showingDetailSeries.toggle()
                                }) {
                                    Text("\(genre.name ?? "name")")
                                }.sheet(isPresented: $showingDetailSeries) {
                                    GenreSeries(SgenreId: SgenreId, GserieList: SeriesList(page:nil, results: nil))
                                }
                        Divider()
                    }
                }
            } .padding()
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
        GenresView(MgenreList: Genres(genres: nil), SgenreList: Genres(genres: nil))
    }
}
