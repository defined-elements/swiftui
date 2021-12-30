//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/7/21.
//

import Foundation
import SwiftUI

class CoverObserver : ObservableObject {
    ///
    @Published var touchBackground: AnyView = AnyView(EmptyView())
    
    ///
    @Published var background: AnyView = AnyView(DEColor.bg.light_3)
    
    ///
    @Published var foreground: AnyView = AnyView(EmptyView())
    
    ///
    @Published var height: CGFloat = 260
    
    ///
    @Published var position: CoverPosition = .center
    
    ///
    @Published var divider: Bool = false
}
