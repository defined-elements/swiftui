//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

///
class HeaderObserver : ObservableObject {
    
    // MARK: - Views
    
    ///
    @Published var content: AnyView = AnyView(EmptyView())
    
    ///
    @Published var background: AnyView = AnyView(DefinedBlurBackground())
    
    ///
    @Published var titleView: DefinedTitle? = nil
    
    // MARK: - Values
    
    ///
    @Published var headerContentType: HeaderContentType = .safeBackAndRight
    
    ///
    @Published var backButtonType: _BackButtonConfiguration = .arrow
    
    ///
    @Published var offset: CGFloat = 0
    
    /// 默认的`Header`高度
    @Published var height: CGFloat = 75
    
    /// `Cover`的高度
    @Published var coverHeight_default: CGFloat = 0
    
    /// 出现`Background`的高度
    @Published var threshold: CGFloat = 70
    
    /// 出现`Content`的高度
    @Published var threshold_content: CGFloat = 120
    
    /// `Background`的透明度
    @Published var backgroundOpacity: Double = 0.0
    
    /// `Content`的透明度
    @Published var contentOpacity: Double = 0.0
    
    /// `Content`的位移量
    @Published var contentOffset: CGFloat = 0.0
    
    /// `Content`的默认位移量
    @Published var contentOffset_default: CGFloat = 11.5
}
