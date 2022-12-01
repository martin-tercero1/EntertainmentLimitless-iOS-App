//
//  NumberFormat.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 11/30/22.
//

import Foundation

enum MS {
    case movie(Int)
    case serie(Int)
}

var Genre: [String : MS] = [
    "Action": .movie(28),
    "Adventure": .movie(12),
    "Animation": .movie(16),
    "Comedy": .movie(35),
    "Crime": .movie(80),
    "Documentary": .movie(99),
    "Drama": .movie(18),
    "Family": .movie(10751),
    "Fantasy": .movie(14),
    "History": .movie(36),
    "Horror": .movie(27),
    "Music": .movie(10402),
    "Mystery": .movie(9648),
    "Romance": .movie(10749),
    "Science_Fiction": .movie(878),
    "TV_Movie": .movie(10770),
    "Thriller": .movie(53),
    "War": .movie(10752),
    "Western": .movie(37)
]


extension String {
    subscript (index: Int) -> Character {
        let charIndex = self.index(self.startIndex, offsetBy: index)
        return self[charIndex]
    }

    subscript (range: Range<Int>) -> Substring {
        let startIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let stopIndex = self.index(self.startIndex, offsetBy: range.startIndex + range.count)
        return self[startIndex..<stopIndex]
    }

}


extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
