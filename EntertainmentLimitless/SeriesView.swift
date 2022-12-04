//
//  SeriesView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct SeriesView: View {
    @State var serieList: SeriesList
    @State var series : [Serie]?
    
    var body: some View {
        serieCard
    }
}

extension SeriesView {
    var serieCard: some View {
        Task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=8f5542b6988efb226030efa69a3226e7")!)
                
                let decodeResponse = try JSONDecoder().decode(SeriesList.self, from: data)
                
                serieList = decodeResponse
                
                series = serieList.results
                
            } catch {
                print ("error", error)
            }
        }
        
        return ScrollView {
            VStack (alignment: .leading) {
                ForEach(series ?? [], id: \.self) { serie in
                    HStack {
                        let serieURL = "https://image.tmdb.org/t/p/w500" + (serie.poster_path ?? "poster")
                        
                        AsyncImage(url: URL(string: serieURL)) {
                            image in image.resizable()
                        }  placeholder: {
                            ProgressView()
                        }
                        .frame(width: 200, height: 290)
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        
                        VStack {
                            Text(serie.name ?? "Title")
                                .frame(width: 100.0)
                            HStack {
                                let x = Double(serie.vote_average ?? 0).rounded(toPlaces: 2)
                                Text("\(String(x))")
                                Spacer()
                                Text(serie.first_air_date?[0..<4] ?? "Release Date")
                            }
                            
                            
                        }
                        
                    }.padding()
                    Collapsible(
                        label: {Text("Read more")},
                        content: {
                            HStack {
                                Text("\(serie.overview ?? "OverView")")
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.white)
                        }
                    )
                    .frame(maxWidth: .infinity)
                    .padding()
                }
            }
        }
    }
}

struct SeriesList: Codable {
    var page: Int?
    var results: [Serie]?
}
struct Serie: Codable, Hashable {
    var adult: Bool?
    var backdrop_path: String?
    var id: Int?
    var name: String?
    var original_language: String?
    var original_name: String?
    var overview: String?
    var poster_path: String?
    var media_type: String?
    var genre_ids: [Int]?
    var popularity: Float?
    var first_air_date: String?
    var vote_average: Float?
    var vote_count: Int?
    var origin_country: [String]?
    
    
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(serieList: SeriesList(page:nil, results: nil))
    }
}
