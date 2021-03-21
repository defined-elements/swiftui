//
//  DefinedNaviDisplay.swift
//  Stdy
//
//  Created by Lingxi Li on 3/20/21.
//

import Foundation
import SwiftUI

struct DefinedNaviDisplay : DefinedView {
    @Binding var content: DefinedNaviPage?
    
    init(binding: Binding<DefinedNaviPage?>) {
        self._content = binding
    }
    
    var body: some View {
        if self.content != nil {
            self.content!.page
        } else {
            EmptyView()
        }
    }
}
