//
//  CoverView.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/17/20.
//

import Foundation
import SwiftUI

/// DefinedCover - 封面组件 @ DefinedElements
///
/// - TODO: Style
@available(iOS 14.0, macOS 11.0, *)
public struct DefinedCover : DefinedView {
    ///
    var content: AnyView
    
    ///
    @ObservedObject var obs = CoverObserver()
    
    ///
    public init(title: String, subtitle: String? = nil) {
        var cont: some View {
            DefinedText(title)
                .preset(.title)
        }
        self.content = AnyView(cont)
    }
    
    ///
    public init<Content>(@ViewBuilder _ cont: @escaping () -> Content) where Content : View {
        self.content = AnyView(cont())
    }
    
    ///
    public func touchBackground<TouchBackground>(_ content: TouchBackground) -> Self where TouchBackground : View {
        self.obs.touchBackground = AnyView(content)
        return self
    }
    
    ///
    public func touchBackground<TouchBackground>(@ViewBuilder content: @escaping () -> TouchBackground) -> Self where TouchBackground : View {
        self.obs.touchBackground = AnyView(content())
        return self
    }
    
    ///
    public func background<Background>(_ content: Background) -> Self where Background : View {
        self.obs.background = AnyView(content)
        return self
    }
    
    ///
    public func background<Background>(@ViewBuilder content: @escaping () -> Background) -> Self where Background : View {
        self.obs.background = AnyView(content())
        return self
    }
    
    /// - Warning: 暂未投入使用！
    public func foreground<Foreground>(_ content: Foreground) -> Self where Foreground : View {
        self.obs.foreground = AnyView(content)
        return self
    }
    
    /// - Warning: 暂未投入使用！
    public func foreground<Foreground>(@ViewBuilder content: @escaping () -> Foreground) -> Self where Foreground : View {
        self.obs.foreground = AnyView(content())
        return self
    }
    
    ///
    public func position(_ position: CoverPosition) -> Self {
        self.obs.position = position
        return self
    }
    
    ///
    public func showDivider(_ showDivider: Bool) -> Self {
        self.obs.divider = showDivider
        return self
    }
    
    // TODO: 直接传入文字信息的构造器
    
    ///
    public var body: some View {
        ZStack(alignment: .center) {
            content
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: self.obs.height)
    }
}
