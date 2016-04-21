//
//  NSExtendions.swift
//  NovelReader
//
//  Created by kangyonggen on 3/28/16.
//  Copyright © 2016 ruikyesoft. All rights reserved.
//

import Foundation

extension String {
    var length: Int {
        return characters.count
    }

    func regexMatch(regex: String) -> Bool {
        do {
            let exp = try NSRegularExpression(pattern: regex, options: .AnchorsMatchLines)
            return exp.matchesInString(self, options: .WithoutAnchoringBounds, range: NSMakeRange(0, length)).count > 0
        } catch _ {
            return false
        }
    }

    func length(encoding: UInt) -> Int {
        return lengthOfBytesUsingEncoding(encoding)
    }
}

extension NSRange {
    var end: Int {
        return location + length
    }
    
    var loc: Int {
        return location
    }
    
    var len: Int {
        return length
    }
    
    var desc: String {
        return String("\(loc)\(len)".hash)
    }
}