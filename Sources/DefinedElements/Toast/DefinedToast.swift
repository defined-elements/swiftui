//
//  DefinedToast.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/26/20.
//

import Foundation
import SwiftUI

struct DefinedToast<Content: View>: View {

    /// The binding that decides the appropriate drawing in the body.
    @Binding var isShowing: Bool
    
    /// The view that will be "presenting" this toast
    let content: () -> Content
    
    /// The text to show
    let text: Text

    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                    .blur(radius: self.isShowing ? 1 : 0)
                VStack {
                    self.text
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .background(Color.secondary.colorInvert())
                .foregroundColor(Color.primary)
                .cornerRadius(20)
                .transition(.slide)
                .opacity(self.isShowing ? 1 : 0)
            }
        }
    }

}
