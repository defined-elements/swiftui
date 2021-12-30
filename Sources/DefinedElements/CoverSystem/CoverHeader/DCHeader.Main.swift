//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/17/21.
//

import Foundation
import SwiftUI

/// DefinedCoverHeader - 封面顶栏 @ DefinedElements
///
/// - Important: `CoverHeader`组件是专为`ScrollView`开发的，非滚动页面的头部不应使用该组件
///
/// - TODO: 开发
/// - TODO: 将Namespace尝试传入不同组件，在不同组件内增加对应init
public struct DefinedCoverHeader {
    
    ///
    @ObservedObject var obs: CoverHeaderObserver = CoverHeaderObserver()
    
    ///
    @Namespace var coverHeaderSpace
    
    ///
    var style: CoverHeaderStyle = .magazine
    
    ///
    var icon: Image? = nil
    
    ///
    var title: String
    
    ///
    var subtitle: String? = nil
    
    ///
    var backButtonType: _BackButtonConfiguration = .arrow
    
    ///
    public init(title: String,
                subtitle: String? = nil,
                icon: Image? = nil,
                back: _BackButtonConfiguration = .arrow,
                style: CoverHeaderStyle = .magazine) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.backButtonType = back
    }
    
    ///
    func getCover() -> DefinedCover {
        // TODO: 未来支持自定义背景与触摸背景
        let cover = DefinedCover(buildCover)
        cover.obs.position = getCoverPosition()
        return cover
    }
    
    ///
    func getHeader() -> DefinedHeader {
        let header = DefinedHeader(back: self.backButtonType, buildHeader)
        self.obs.headerObs = header.obs
        return header
    }
    
    ///
    @ViewBuilder func buildCover() -> some View {
        // 杂志封面
        // TODO: 动效
        if self.style == .magazine {
            DefinedContent(.overlay, alignment: .leading) {
                DefinedContent(.vertical, alignment: .leading) {
                    DefinedText(self.title)
                        .preset(.title)
                        .padding(.bottom, 2)
                    
                    // TODO: 问题在于此处调用obs并不会进行实时更新
                    
                    if self.subtitle != nil {
                        DefinedText(self.subtitle!)
                            .preset(.subtitle)
                            .contentColor(DEColor.text.dark_4)
                            .padding(.top, 12)
                    }
                }
                .padding(.horizontal, 30)
                .padding(.vertical, 33)
                .definedSize(width: .full)
            }
            .definedSize(width: .full, height: .full, alignment: .bottom)
        }
        
        //
        if self.style == .center {
            EmptyView()
        }
        
        //
        if self.style == .center_side {
            EmptyView()
        }
    }
    
    ///
    @ViewBuilder func buildHeader() -> some View {
        DefinedText(self.title)
            .preset(.header_title)
            // .matchedGeometryEffect(id: "title", in: coverHeaderSpace)
    }
    
    ///
    func getCoverPosition() -> CoverPosition {
        switch self.style {
        case .magazine:
            return .bottom
        default:
            return .center
        }
    }
}
