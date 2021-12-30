//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

/// DefinedTitle - 标题文字 @ DefinedElements
///
/// - TODO: 折叠Bug
@available(iOS 14.0, macOS 11.0, *)
public struct DefinedTitle : DefinedView {
    @ObservedObject var obs = TitleObserver()

    ///
    public init(_ title: String, icon: String? = nil, subtitle: String? = nil, header: Bool = false) {
        self.obs.type = header ? .header : .preset
        self.obs.titleText = title
    }
    
    ///
    public init<Content>(@ViewBuilder content: () -> Content) where Content: View {
        // 调用带有滚动高度ViewBuilder
        self.init({ offset in
            content()
        })
    }
    
    ///
    public init<Content>(@ViewBuilder _ content: (CGFloat) -> Content) where Content: View {
        self.obs.content = AnyView(content(self.obs.offset))
    }
    
    ///
    public var body: some View {
        // 预设
        if self.obs.type == .preset {
            DefinedContent(.vertical) {
                if self.obs.titleText != nil {
                    DefinedText(self.obs.titleText!)
                        .preset(.title)
                }
            }
        } else if self.obs.type == .header {
            DefinedContent(.vertical) {
                if self.obs.titleText != nil {
                    DefinedText(self.obs.titleText!)
                        .preset(.header_title)
                }
            }
        } else if self.obs.type == .custom {
            self.obs.content
        }
    }
    
    ///
    func callOnScroll(_ offset: CGFloat) {
        self.obs.offset = offset
    }
}
