//
//  CoverView.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/17/20.
//

import Foundation
import SwiftUI

struct DefinedCoverView<Content> : DefinedView where Content : View {
    var content: Content
    
    init(@ViewBuilder _ cont: @escaping () -> Content) {
        self.content = cont()
    }
    
    var body: some View {
        content
    }
}
