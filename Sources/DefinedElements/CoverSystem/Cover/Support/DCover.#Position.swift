//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/29/21.
//

import Foundation
import SwiftUI

///
public enum CoverPosition {
    case center
    
    case top
    
    case bottom
}

public extension CoverPosition {
    func get() -> Alignment {
        switch self {
        case .center:
            return .center
        case .top:
            return .top
        case .bottom:
            return .bottom
        }
    }
}
