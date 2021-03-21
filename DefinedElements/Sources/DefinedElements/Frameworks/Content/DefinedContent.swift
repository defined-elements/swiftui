//
//  DefinedContent.swift
//  Stdy
//
//  Created by Lingxi Li on 3/16/21.
//

import Foundation
import SwiftUI

/// 界面元素容器 @ DefinedElements
struct DefinedContent<Content> : DefinedView where Content : View {
    var content: Content
    var alignment: Alignment
    
    init(alignment: Alignment = .center, @ViewBuilder _ cont: @escaping () -> Content) {
        // TODO: 寻找如果Content中包含特定元素则提取出来进行状态回调
        self.content = cont()
        self.alignment = alignment
    }
    
    var body: some View {
        ZStack(alignment: self.alignment) {
            content
        }
    }
}
