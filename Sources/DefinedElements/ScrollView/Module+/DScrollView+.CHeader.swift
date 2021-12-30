//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/20/21.
//

import Foundation
import SwiftUI

/// CoverHeader 支持 - DefinedScrollView @ DefinedElements
public extension DefinedScrollView {
    ///
    func coverHeader(title: String) -> Self {
        return self.coverHeader(title: title, subtitle: nil, icon: nil, back_button_type: .arrow, style: .magazine)
    }
    
    ///
    func coverHeader(title: String, subtitle: String, style: CoverHeaderStyle) -> Self {
        return self.coverHeader(title: title, subtitle: subtitle, icon: nil, back_button_type: .arrow, style: style)
    }
    
    ///
    func coverHeader(title: String, icon: Image, style: CoverHeaderStyle) -> Self {
        return self.coverHeader(title: title, subtitle: nil, icon: icon, back_button_type: .arrow, style: style)
    }
    
    ///
    func coverHeader(title: String, subtitle: String, icon: Image, style: CoverHeaderStyle) -> Self {
        return self.coverHeader(title: title, subtitle: subtitle, icon: icon, back_button_type: .arrow, style: style)
    }
    
    ///
    func coverHeader(title: String,
                     subtitle: String? = nil,
                     icon: Image? = nil,
                     back_button_type back: _BackButtonConfiguration = .arrow,
                     style: CoverHeaderStyle = .magazine) -> Self {
        let coverHeader = DefinedCoverHeader(title: title,
                                             subtitle: subtitle,
                                             icon: icon,
                                             back: back,
                                             style: style)
        
        let header = coverHeader.getHeader()
        let cover = coverHeader.getCover()
        
        setCover(cover)
        
        self.obs.header = header.setCoverHeight(self.obs.coverHeight_default)

        return self
    }
    
    ///
    func coverHeaderStyle(_ style: CoverHeaderStyle) -> Self {
        // TODO:
        return self
    }
}
