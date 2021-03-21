//
//  DefinedLink.swift
//  Stdy
//
//  Created by Lingxi Li on 3/20/21.
//

import Foundation
import SwiftUI

extension View {

    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<Target>(to view: Target, when binding: Binding<Bool>) -> some View where Target : View {
        NavigationView {
            ZStack {
                self // 当前元素

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
            }
        }
    }
}
