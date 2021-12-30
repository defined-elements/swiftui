//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

///
public struct DefinedBackButton : DefinedView {
    var type: _BackButtonConfiguration
    
    public init(_ type: _BackButtonConfiguration = .arrow) {
        self.type = type
    }
    
    public var body: some View {
        if type == .arrow {
            Image("LeftArrow", bundle: .module)
                .resizable()
                .scaledToFit()
        } else if type == .cross {
            // TODO:
        } else {
            EmptyView()
        }
    }
}
