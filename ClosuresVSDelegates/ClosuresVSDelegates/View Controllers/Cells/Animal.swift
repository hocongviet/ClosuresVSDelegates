//
//  Animal.swift
//  ClosuresVSDelegates
//
//  Created by Vladimir Ho on 13.10.2019.
//  Copyright © 2019 Viety Software. All rights reserved.
//

import Foundation

enum Animal {
    case dog
    case cat
    case snake
    case pig
    case lion
    
    var emoji: String {
        switch self {
        case .dog:
            return "🐶"
        case .cat:
            return "🐱"
        case .snake:
            return "🐍"
        case .pig:
            return "🐷"
        case .lion:
            return "🦁"
        }
    }
    
    var name: String {
        switch self {
        case .dog:
            return "Dog"
        case .cat:
            return "Cat"
        case .snake:
            return "Snake"
        case .pig:
            return "Pig"
        case .lion:
            return "Lion"
        }
    }
    
    var noise: String {
        switch self {
        case .dog:
            return "Bark"
        case .cat:
            return "Meow"
        case .snake:
            return "Hiss"
        case .pig:
            return "Snort"
        case .lion:
            return "Roar"
        }
    }
    
}
