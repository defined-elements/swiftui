//
//  DefinedDimens.swift
//
//  Created by Lingxi Li on 12/14/20.
//

import Foundation
import SwiftUI

enum Dimens {
    /// 圆角 - 标准
    case CORNER_STR
    
    /**
     
     */
    func get() -> CGFloat {
        switch self {
        case .CORNER_STR:
            return 18
        }
    }
}
