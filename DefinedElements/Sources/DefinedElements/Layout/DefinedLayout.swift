//
//  DefinedStack.swift
//  Stdy
//
//  Created by Lingxi Li on 3/15/21.
//

import Foundation
import SwiftUI

/**
 当前版本就是一个整合版Stack
 */
// TODO:
public struct DefinedLayout<Content> : View where Content : View {
    private var content: () -> Content
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    public var body: some View {
        EmptyView()
    }
}
