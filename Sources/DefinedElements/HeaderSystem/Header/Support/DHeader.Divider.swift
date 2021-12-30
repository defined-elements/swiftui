//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/12/21.
//

import Foundation
import SwiftUI

///
struct DefinedHeaderDivider : DefinedView {
    public var body: some View {
        Rectangle()
            .definedSize(width: .full)
            .frame(height: DEDimen.divider.thickness)
            .foregroundColor(DEColor.divider.grey_1.opa())
    }
}
