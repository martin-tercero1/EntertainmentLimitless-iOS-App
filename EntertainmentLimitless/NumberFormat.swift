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
    "Science Fiction": .movie(878),
    "TV Movie": .movie(10770),
    "Thriller": .movie(53),
    "War": .movie(10752),
    "Western": .movie(37),
    
    "Action & Adventure": .serie(10759),
    "Animation": .serie(16),
    "Comedy": .serie(35),
    "Crime": .serie(80),
    "Documentary": .serie(99),
    "Drama": .serie(18),
    "Family": .serie(10751),
    "Kids": .serie(10762),
    "Mystery": .serie(9648),
    "News": .serie(10763),
    "Reality": .serie(10764),
    "Sci-Fi & Fantasy": .serie(10765),
    "Soap": .serie(10766),
    "Talk": .serie(10767),
    "War & Politics": .serie(10768),
    "Western": .serie(37)
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
