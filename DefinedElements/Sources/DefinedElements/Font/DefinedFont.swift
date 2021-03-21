//
//  DefinedFont.swift
//  Stdy
//
//  Created by Lingxi Li on 3/15/21.
//

import Foundation
import SwiftUI

/// 该 Class 用来存储统一的字号规范
public class Fonts {
    enum Family {
        case SarasaFixedSC
        
        func get() -> String {
            switch self {
            case .SarasaFixedSC:
                return "sarasa-fixed-sc-regular"
            }
        }
    }
    
    static let title = Font.custom(Family.SarasaFixedSC.get(), size: 29).weight(.bold)
    static let semiTitle = Font.custom(Family.SarasaFixedSC.get(), size: 23).weight(.bold)
    static let thirdTitle = Font.custom(Family.SarasaFixedSC.get(), size: 15).weight(.bold)
    
    static let subTitle = Font.custom(Family.SarasaFixedSC.get(), size: 14).weight(.semibold)
    
    static let buttonMain = Font.custom(Family.SarasaFixedSC.get(), size: 20).weight(.semibold)
    
    static let body = Font.custom(Family.SarasaFixedSC.get(), size: 17)
    static let content = Font.custom(Family.SarasaFixedSC.get(), size: 17).weight(.semibold)
    static let note = Font.custom(Family.SarasaFixedSC.get(), size: 12).weight(.semibold)
    
    static let number = Font.custom(Family.SarasaFixedSC.get(), size: 45).weight(.bold)
    static let numberNote = Font.custom(Family.SarasaFixedSC.get(), size: 13).weight(.heavy)
    
    // 特殊定义
    static let textNumber = Font.custom("DIN-Medium", size: 23)
    static let smallNumber = Font.custom("DIN-Medium", size: 35)
    static let largeNumber = Font.custom("DIN-Medium", size: 55)
    static let extraLargeNumber = Font.custom("DIN-Medium", size: 110)
}

public enum FontDimens {
    // 默认字间距
    case DEFAULT_TRACKING
    
    // 默认行间距
    case DEFAULT_LINE_SPACING
    
    func get() -> CGFloat {
        switch self {
        case .DEFAULT_TRACKING:
            return 0.1
        case .DEFAULT_LINE_SPACING:
            return 0.4
        }
    }
}
