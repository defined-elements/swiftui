//
//  DefinedPage.swift
//  Stdy
//
//  Created by Lingxi Li on 3/16/21.
//

import Foundation
import SwiftUI

public protocol DefinedPage : View {
    ///
    associatedtype Content: View
    
    ///
    @ViewBuilder var main: Content { get }
}

extension DefinedPage {
    ///
    public var body: some View {
        process()
    }
    
    ///
    func process() -> some View {
        // var a = 0
        // TODO: 处理
        return getMain()
    }
    
    ///
    @ViewBuilder
    func getMain() -> some View {
        ZStack(alignment: .center) {
            self.main
                .navigationBarTitle("")
                .navigationBarHidden(true)
        }
        .definedFullSize()
    }
}
