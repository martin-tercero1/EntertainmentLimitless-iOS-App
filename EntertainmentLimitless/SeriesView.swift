//
//  SeriesView.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano & Martin Tercero on 11/13/22.
//

import SwiftUI

struct SeriesView: View {
    @State var serie: SeriesList
    
    var body: some View {
        VStack {
            Text(serie.results?[0].name ?? "Tv Series")
            Button("Lets generate trending series") {
                Task {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.themoviedb.org/3/trending/tv/day?api_key=8f5542b6988efb226030efa69a3226e7")!)
                        
                        let decodeResponse = try JSONDecoder().decode(SeriesList.self, from: data)
                        
                        serie = decodeResponse
                    } catch {
                        print ("error", error)
                    }
                }
            }
        }
    }
}



struct SeriesList: Codable {
    var page: Int?
    var results: [Serie]?
}
struct Serie: Codable {
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
        SeriesView(serie: SeriesList(page:nil, results: nil))
    }
}
