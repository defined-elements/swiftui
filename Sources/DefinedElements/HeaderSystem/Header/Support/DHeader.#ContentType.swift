//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

///
public enum HeaderContentType {
    ///
    case overlay
    
    ///
    case safeBackArea
    
    ///
    case safeLeftArea
    
    ///
    case safeRightArea
    
    ///
    case safeBackAndRight
    
    ///
    case safeLeftAndRight
    
    ///
    func getLeft() -> CGFloat {
        switch self {
        case .safeLeftArea:
            return DEDimen.header.side_area
        case .safeLeftAndRight:
            return DEDimen.header.side_area
        case .safeBackArea:
            return DEDimen.header.back_area
        case .safeBackAndRight:
            return DEDimen.header.back_area
        default:
            return 0
        }
    }
    
    ///
    func getRight() -> CGFloat {
        switch self {
        case .safeRightArea:
            return DEDimen.header.side_area
        case .safeLeftAndRight:
            return DEDimen.header.side_area
        case .safeBackAndRight:
            return DEDimen.header.side_area
        default:
            return 0
        }
    }
}
