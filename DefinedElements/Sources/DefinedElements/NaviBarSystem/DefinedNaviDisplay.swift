//
//  DefinedNaviDisplay.swift
//  Stdy
//
//  Created by Lingxi Li on 3/20/21.
//

import Foundation
import SwiftUI

public struct DefinedNaviDisplay : DefinedView {
    @Binding public var content: DefinedNaviPage?
    
    public init(binding: Binding<DefinedNaviPage?>) {
        self._content = binding
    }
    
    public var body: some View {
        if self.content != nil {
            self.content!.page
        } else {
            EmptyView()
        }
    }
}
