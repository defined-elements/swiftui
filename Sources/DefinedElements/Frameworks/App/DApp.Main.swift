import Foundation
import SwiftUI

/// [DE] A SwiftUI App-Lifecycle based startup module for initializing your application.
///
/// This module is highly embeded, which includes the `WindowGroup` and more.
/// So please do not use it as a scene (which is a component for `WindowGroup`).
///
/// ```
/// @main
/// struct YourAppName: DefinedApp {
///     /// Your startup page, which has to be conformed to DefinedPage.
///     var start = StartPage()
/// }
/// ```
///
/// - TODO: 多系统的条件支持
/// - TODO: iPadOS版本开发
/// - TODO: macOS版本开发
/// - TODO: 针对macOS多窗口功能进行优化
/// - TODO: StatusBar部分针对macOS进行优化
public protocol DefinedApp : App {
    /// The startup page type for iOS and iPadOS.
    associatedtype Page: DefinedPage
    
    /// The startup page type for macOS.
    associatedtype Page_MacOS: DefinedPage
    
    /// The starting point.
    ///
    /// The first page when starting up the application on iOS and iPadOS.
    ///
    /// - Important: This is required! We are now NOT aiming to create an app not supporting the iOS!
    @ViewBuilder var start: Page { get }
    
    /// The starting point of macOS.
    ///
    /// The first page when starting up the application on macOS.
    ///
    /// - Note: It is not required! You may not objectize this variable if you are not aiming to create a macOS app.
    @ViewBuilder var start_macOS: Page_MacOS { get }
}

public extension DefinedApp {
    var start_macOS: some DefinedPage {
        start
    }
}

// MARK: - Body

public extension DefinedApp {
    /// The main body of DefinedApp.
    ///
    /// - Important: You should NOT override this method.
    @SceneBuilder var body: some Scene {
        // MARK: > iOS
        
        #if os(iOS)
        
        WindowGroup {
            EmptyView()
                .onAppear(perform: {
                    UIApplication.setController(rootView: DefinedViewStack(from: self.start))
                })
        }
        
        #endif
                
        // MARK: > macOS
        
        #if os(macOS)
        
        WindowGroup {
            DefinedViewStack(from: self.start_macOS) // TODO: Waiting to be developed
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        
        #endif
    }
}
