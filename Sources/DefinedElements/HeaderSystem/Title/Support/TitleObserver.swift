//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

///
class TitleObserver : ObservableObject {
    ///
    @Published var content: AnyView = AnyView(EmptyView())
    
    ///
    @Published var offset: CGFloat = 0
    
    ///
    @Published var type: TitleContentType = .custom
    
    // MARK: - For Preset TitleView
    
    @Published var titleText: String? = nil
}
