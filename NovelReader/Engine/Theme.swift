//
//  Theme.swift
//  NovelReader
//
//  Created by kangyonggen on 3/31/16.
//  Copyright © 2016 ruikyesoft. All rights reserved.
//

import Foundation

class Theme {
    private(set) var foregroundColor: UIColor = UIColor.blackColor()
    private(set) var backgroundColor: UIColor = UIColor.whiteColor()
    private(set) var boardMaskNeeded: Bool = false

    static var NIGHT: String { return "Night" }
    static var SEPIA: String { return "Sepia" }
    static var DEFAULT: String { return "Sepia" }
    static var PARCHMENT: String { return "Parchment" }
    static var EYESHIELD: String { return "Eyeshield" }
    
    enum Info: Int {
        case Default = 0
        case Parchment
        case Eyeshield
        case Night
        
		var name: String {
			switch self {
			case .Default:
				return "Sepia"
			case .Parchment:
				return "Parchment"
			case .Eyeshield:
				return "Eyeshield"
			case .Night:
				return "Night"
			}
		}
    }
    
    var name: String {
        return Theme.DEFAULT
    }

    var statusBarStyle: UIStatusBarStyle {
        return .Default
    }

    var menuColor: UIColor {
        return foregroundColor
    }

    var menuBackgroundColor: UIColor {
        return backgroundColor
    }
    
    static func forName(info:Info?) -> Theme {
        if let i = info {
            switch i {
            case .Default:
                return Sepia()
            case .Eyeshield:
                return Eyeshield()
            case .Night:
                return Night()
            case .Parchment:
                return Parchment()
            }
        } else {
            return Sepia()
        }
    }

    class Parchment: Theme {
        private static var bgColor: UIColor? = nil

        private var menuBgColor = UIColor(red:0.780,  green:0.633,  blue:0.455, alpha:1)

        override var name: String { return Theme.PARCHMENT }

        override var menuBackgroundColor: UIColor {
            return menuBgColor
        }

        override init() {
            super.init()
            foregroundColor = UIColor.blackColor()
            boardMaskNeeded = true

            if let bgc = Parchment.bgColor {
                backgroundColor = bgc
            } else {
                var parchment: dispatch_once_t = 0
                dispatch_once(&parchment) {
                    let patch1 = UIImage(named: "reading_parchment1")
                    let patch2 = UIImage(named: "reading_parchment2")
                    let patch3 = UIImage(named: "reading_parchment3")
                    let border = (patch1?.size.width)!
                    let size = CGSizeMake(border * 2, 2 * border)

                    UIGraphicsBeginImageContext(size);
                    patch1?.drawInRect(CGRectMake(0, 0, border, border))
                    patch3?.drawInRect(CGRectMake(0, border, border, border))
                    patch2?.drawInRect(CGRectMake(border, 0, border, border))
                    patch1?.drawInRect(CGRectMake(border, border, border, border))

                    self.backgroundColor = UIColor(patternImage: UIGraphicsGetImageFromCurrentImageContext())
                    Parchment.bgColor = self.backgroundColor
                }
            }
        }
    }

    class Night: Theme {
        override var name: String { return Theme.NIGHT }

        override init() {
            super.init()
            foregroundColor = UIColor(red: 0.310, green: 0.407, blue: 0.478, alpha: 1)
            backgroundColor = UIColor(red: 0.097, green: 0.129, blue: 0.158, alpha: 1)
        }
    }

    class Sepia: Theme {
        override var name: String { return Theme.SEPIA }

        override init() {
            super.init()
            foregroundColor = UIColor(red: 0.099, green: 0.031, blue: 0.006, alpha: 1)
            backgroundColor = UIColor(red: 0.798, green: 0.746, blue: 0.654, alpha: 1)
        }
    }

    class Eyeshield: Theme {
        override var name: String { return Theme.EYESHIELD }

        override init() {
            super.init()
            foregroundColor = UIColor(red: 0.117, green: 0.143, blue: 0.113, alpha: 1)
            backgroundColor = UIColor(red: 0.695, green: 0.822, blue: 0.710, alpha: 1)
        }
    }
}
