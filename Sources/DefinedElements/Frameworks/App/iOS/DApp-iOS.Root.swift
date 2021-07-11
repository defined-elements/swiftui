#if os(iOS)

import Foundation
import SwiftUI

internal struct DefinedAppRoot<StartPage> : Scene where StartPage: DefinedPage {
    var start: StartPage
    
    init(from: StartPage) {
        self.start = from
    }
    
    var body: some Scene {
        WindowGroup {
            EmptyView()
                .onAppear(perform: {
                    UIApplication.startApplication(from: self.start)
                })
        }
    }
}

#endif
