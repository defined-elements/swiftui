//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

/// DefinedHeader - 顶栏 @ DefinedElements
@available(iOS 14.0, macOS 11.0, *)
public struct DefinedHeader : DefinedView {
    ///
    @ObservedObject var obs = HeaderObserver()
    
    ///
    private let fadeInterval: CGFloat = 70
    
    ///
    private let fadeInterval_content: CGFloat = 50
    
    // MARK: - Constructors
    
    ///
    public init(back: _BackButtonConfiguration = .arrow,
                title: DefinedTitle? = nil) {
        self.init(back: back, { offset in
            if title != nil {
                title!
            }
        })
    }
    
    ///
    public init<Content>(back: _BackButtonConfiguration = .arrow,
                         @ViewBuilder _ content: () -> Content) where Content: View {
        self.init(back: back, { offset in /* 调用带有滚动高度ViewBuilder */
            content()
        })
    }
    
    ///
    public init<Content>(back: _BackButtonConfiguration = .arrow,
                         @ViewBuilder _ content: (CGFloat) -> Content) where Content: View {
        self.obs.content = AnyView(content(self.obs.offset))
        self.obs.backButtonType = back
        if back == .none {
            self.obs.headerContentType = .safeLeftAndRight
        }
    }
    
    // MARK: - Body
    
    ///
    public var body: some View {
        DefinedContent(.overlay, alignment: .top) {
            DefinedContent(.overlay, alignment: .leading) {
                // 核心内容
                self.obs.content
                    .padding(.leading, self.obs.headerContentType.getLeft())
                    .padding(.trailing, self.obs.headerContentType.getRight())
                    .definedSize(width: .full, height: self.obs.height, alignment: .leading)
                    .opacity(self.obs.contentOpacity)
                    .offset(y: self.obs.contentOffset)
                
                // 返回按钮
                if self.obs.backButtonType != .none {
                    DefinedBackButton(self.obs.backButtonType)
                        .frame(width: 30, height: 30, alignment: .center)
                        .padding(.leading, 22)
                        .scaledToFit()
                        .onTapGesture {
                            // DefinedViewManager.get().pop()
                        }
                }
            }
            .frame(height: self.obs.height)
        }
        .definedSize(width: .full, height: .full, alignment: .top)
        .frame(height: max(self.obs.height, self.obs.coverHeight_default - self.obs.offset))
        .background(
            self.obs.background
                .defined(exceed_safe_area: .top)
                .overlay(
                    DefinedHeaderDivider()
                        .definedSize(
                            width: .full,
                            height:.full,
                            alignment: .top
                        )
                )
                .opacity(self.obs.backgroundOpacity)
        )
        .definedSize(width: .full)
    }
    
    ///
    func setCoverHeight(_ height: CGFloat) -> Self {
        self.obs.coverHeight_default = height
        return self
    }
    
    ///
    func defShowing(_ isDefShowing: Bool = true) -> Self {
        self.obs.contentOpacity = isDefShowing ? 1.0 : 0.0
        self.obs.backgroundOpacity = isDefShowing ? 1.0 : 0.0
        return self
    }
    
    ///
    func callOnScroll(_ offset: CGFloat) {
        if offset >= 0 {
            self.obs.offset = offset
            
            self.obs.backgroundOpacity = min(max(0.0, Double((self.obs.offset - self.obs.threshold) / self.fadeInterval)), 1.0)
            
            self.obs.contentOpacity = min(max(0.0, Double((self.obs.offset - self.obs.threshold_content) / self.fadeInterval_content)), 1.0)
            
            self.obs.contentOffset = CGFloat((1.0 - self.obs.contentOpacity)) * self.obs.contentOffset_default
            
            if self.obs.titleView != nil {
                self.obs.titleView!.callOnScroll(offset)
            }
        }
    }
}
