//
//  NumberFormat.swift
//  EntertainmentLimitless
//
//  Created by Duilio Rosciano on 11/30/22.
//

import Foundation

struct NumberFormat {
    func year(_ date: String) -> String {
        var year = date[0..<3]
        return String(year)
    }
}


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
