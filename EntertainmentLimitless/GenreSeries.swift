//
//  GenreSeries.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 12/4/22.
//

import SwiftUI

struct GenreSeries: View {
    @State var SgenreId: Int
    
    @State var GserieList: SeriesList
    @State var Gseries : [Serie]?
    
    var body: some View {
        sGenreCard
        }
}

extension GenreSeries {
    var sGenreCard: some View {
        Task {
            do {
                
                var components = URLComponents()
                components.scheme = "https"
                components.host = "api.themoviedb.org"
                components.path = "/3/discover/tv"
                components.queryItems = [
                    URLQueryItem(name: "api_key", value: "8f5542b6988efb226030efa69a3226e7"),
                    URLQueryItem(name: "with_genres", value: "\(SgenreId)")
                ]
                
                let url = components.url
                
                let (data, _) = try await URLSession.shared.data(from: url!)
                
                let decodeResponse = try JSONDecoder().decode(SeriesList.self, from: data)
                
                GserieList = decodeResponse
                
                Gseries = GserieList.results
                
            } catch {
                print ("error", error)
            }
        }
        return ScrollView {
            VStack (alignment: .leading) {
                ForEach(Gseries ?? [], id: \.self) { serie in
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
                            Divider()
                            VStack {
                                let x = Double(serie.vote_average ?? 0).rounded(toPlaces: 2)
                                Text("\(String(x))")
                                Divider()
                                Text(serie.first_air_date ?? "Date not Found")
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
                    Divider()
                }
            }
        }
        }
    }

struct GenreSeries_Previews: PreviewProvider {
    static var previews: some View {
        GenreSeries(SgenreId: 10759, GserieList: SeriesList(page:nil, results: nil))
    }
}
