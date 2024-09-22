//
//  Int+.swift
//  PublicRepositories
//
//  Created by Bùi Văn Thương on 9/22/24.
//

import Foundation

extension Int {
    func shorted() -> String {
        if self >= 1000 && self < 10000 {
            return String(format: "%.1fk", Double(self/100)/10).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 10000 && self < 1000000 {
            return String(format: "%.1fk", Double(self)/1000).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 1000000 && self < 10000000 {
            return String(format: "%.1fM", Double(self/100000)/10).replacingOccurrences(of: ".0", with: "")
        }
        
        if self >= 10000000 {
            return "\(self/1000000)M"
        }
        
        return String(self)
    }
}
