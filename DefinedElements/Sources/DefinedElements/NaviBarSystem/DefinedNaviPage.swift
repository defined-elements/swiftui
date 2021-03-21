//
//  DefinedNaviPage.swift
//  Stdy
//
//  Created by Lingxi Li on 3/20/21.
//

import Foundation
import SwiftUI

/// DefinedNaviPage
///
/// 用于给 Fragment 添加变量定义以更好地与 DefinedNaviBar 进行适配。
/// - Important: 在定义 Fragment 的时候，务必添加 DefinedNaviPage 类型。
public protocol DefinedNaviPage {
    /// 标签（用于区分，可在特殊情况下重复）
    var tag: String { get }
    var page: AnyView { get }
}
