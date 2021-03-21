//
//  CoverView.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/17/20.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, *)
public struct DefinedCoverView<Content> : View where Content : View {
    var content: Content
    
    init(@ViewBuilder _ cont: @escaping () -> Content) {
        self.content = cont()
    }
    
    public var body: some View {
        content
    }
}
