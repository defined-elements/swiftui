#if os(iOS)

import SwiftUI

/// [DE] A protocol for building a page that fits into page system.
///
/// To distinguish between a Page (an entire area showing some contents) and a View (a content component), we define the `DefinedPage` so that the page can have its special APIs specifying for a page and work much better with the view stack system.
///
/// We empower the page the ability of linking to another page, jumping to another page, back to the previous page, etc. Those are not even possible if we mix the Page and View up because a View should not have such things directly.
///
/// - Note: Currently, we have done the optimization on algorithm, but I am not able to do the performance optimization on raw executing layer and rendering layer yet (still learning). I am planning to finish all performance optimizations in our 2.0 release.
///
/// - Important: `DefinedViewStack` really relys on this protocol!
public protocol DefinedPage : View {
    
    // MARK: - Protocol - Main Part
    
    /// The main controller using to control your current page.
    ///
    /// This is optional, but highly recommanded because you will lose the control without it.
    /// Only NOT implement it when this page is used for an only-one-page stack.
    ///
    /// You only need to do a simple work:
    ///
    /// ``` swift
    /// var controller: DefinedPageController = .init()
    /// ```
    ///
    /// - Important: If you do not implement this on your page,
    ///   you may NOT be able to control the router!
    ///   Even the short-hand functions like ``link(to:)`` and ``jump(to:)`` will all be disabled without controller!
    var controller: DefinedPageController { get }
    
    /// The page id that will be unique universally.
    ///
    /// Being used on determining the page identity in `DefinedViewStack` system and `DefinedViewManager` system.
    var id: UUID { get }
    
    /// The status bar style of this page.
    ///
    /// The default value is `.darkContent` if developer does not define this variable locally.
    /// You will not be able to do any change without defining it locally.
    ///
    /// You can define this variable as the status bar style on starting up this page.
    ///
    /// ``` swift
    /// // make status bar content white on starting up the page.
    /// var statusBarStyle: UIStatusBarStyle = .lightContent
    /// ```
    ///
    /// You can make this variable `@State` to modify the status bar style dynamically.
    ///
    /// ``` swift
    /// // make status bar content white on starting up the page
    /// // and can be dynamically modify during the runtime.
    /// @State var statusBarStyle: UIStatusBarStyle = .lightContent
    ///
    /// func run() {
    ///     // make the status bar content black
    ///     self.statusBarStyle = .darkContent
    /// }
    /// ```
    var statusBarStyle: UIStatusBarStyle { get }
    
    /// [DE ShouldNotUse] The body of the page view.
    ///
    /// You should implement the body on `main` instead of here.
    /// Do NOT implement this variable on your `DefinedPage`!
    ///
    /// - Important: You should NOT implement anything on `body`! It will break the functionalities of everything (it is due to the original SwiftUI View system, we are planning to build our own RawView system in 2.0 release).
    var body: Self.Body { get }
    
    /// The type of view representing the content of this page.
    ///
    /// This will be associated automatically when you implement the required property ``main``.
    associatedtype Content: View
    
    /// The main content of this page. Need to be implemented.
    @ViewBuilder var main: Content { get }
    
    /// Execute before the page starts loading its content.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func beforePageLoading() -> Void
    
    /// Execute after the page finishes loading all of its content.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func onPageLoaded() -> Void
    
    /// Execute right before the page has been destroyed and collected.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func onPageEnded() -> Void
}

public extension DefinedPage {
    /// Inactive `DefinedPageController`.
    ///
    /// If you do NOT define `controller` property locally, the PageController will be disabled!
    /// Even though it is still accessible (we have no way to hide it out), it will not work at all.
    var controller: DefinedPageController {
        DefinedPageController()
    }
    
    /// The page id that will be unique universally.
    ///
    /// Being used on determining the page identity in `DefinedViewStack` system and `DefinedViewManager` system.
    ///
    /// - Note: The actual page id is stored inside the PageController since we cannot have stored property in the extension. This is a getter so if developer does not specify another stored `id` in the page, the page can still have a stored ID to be identified.
    var id: UUID {
        controller.id
    }
}

// MARK: - LifeCycle

public extension DefinedPage {
    /// Execute before the page starts loading its content. Do nothing.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func beforePageLoading() -> Void {
        // do nothing.
        return
    }
    
    /// Execute after the page finishes loading all of its content. Do nothing.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func onPageLoaded() -> Void {
        // do nothing.
        return
    }
    
    /// Execute right before the page has been destroyed and collected. Do nothing.
    ///
    /// - Note: You do NOT need to implement it if you do not execute anything at this phase.
    func onPageEnded() -> Void {
        // do nothing.
        return
    }
}

// MARK: - StatusBarStyle

public extension DefinedPage {
    /// The status bar style of this page.
    ///
    /// The default value is `.darkContent` if developer does not define this variable locally.
    /// You will not be able to do any change without defining it locally.
    ///
    /// For more information, check the `statusBarStyle` property in ``DefinedPage`` protocol.
    var statusBarStyle: UIStatusBarStyle { .darkContent }
}

// MARK: - ShortHand - link()

public extension DefinedPage {
    /// [DE] Link to another page.
    ///
    /// Link means going to the next level (sub-page/child-page).
    /// The current page will be the ancestor of the target page.
    ///
    /// When you need to link to another page, just call it in your `DefinedPage`:
    ///
    /// ``` swift
    /// link(to: TargetPage())
    /// ```
    ///
    /// You can do something like "link when clicking":
    ///
    /// ``` swift
    /// Button("fake button") {
    ///     // link to TargetPage when clicking the "fake button".
    ///     link(to: TargetPage())
    /// }
    /// ```
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    func link<Page>(to target: Page) where Page: DefinedPage {
        DefinedViewManager.find(self).link(to: target)
    }
    
    /// [DE] Link to another page after a few seconds.
    ///
    /// Link means going to the next level (sub-page/child-page).
    /// The current page will be the ancestor of the target page.
    ///
    /// When you need to link to another page, just call it in your `DefinedPage`:
    ///
    /// ``` swift
    /// // link to TargetPage after 1 sec
    /// link(to: TargetPage(), delay: 1.0)
    /// ```
    ///
    /// You can do something like "link when clicking":
    ///
    /// ``` swift
    /// Button("fake button") {
    ///     // link to TargetPage in 1 sec after clicking
    ///     link(to: TargetPage(), delay: 1.0)
    /// }
    /// ```
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    ///   - delay: The time you want to delay (in second).
    func link<Page>(to target: Page, delay: Double) where Page: DefinedPage {
        if delay >= 0.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                link(to: target)
            }
        }
    }
}

// MARK: - ShortHand - back()

extension DefinedPage {
    /// [DE] Back to the previous page.
    ///
    /// Back means pop up the current page and step back to the previous level.
    /// The current page will be destroyed and collected.
    ///
    /// When you need to go back to the previous page, just call it in your `DefinedPage`:
    ///
    /// ``` swift
    /// // back to the previous page when executing
    /// back()
    /// ```
    ///
    /// You can do something like "back button":
    ///
    /// ``` swift
    /// Button("back button") {
    ///     // back to the previous page when clicking
    ///     back()
    /// }
    /// ```
    public func back() {
        DefinedViewManager.find(self).back()
    }
}

// MARK: - ShortHand - jump()

public extension DefinedPage {
    /// [DE] Jump to another page.
    ///
    /// Jump means cleaning the entire view stack and put target page at the new first level.
    /// The current page will be destroyed and collected.
    /// And you are not able to use `back()` because the target page becomes the first level page and there is no way to go back from the first level page.
    ///
    /// When you need to jump to another page, just call it in your `DefinedPage`:
    ///
    /// ``` swift
    /// // replace all views in stack with the target page
    /// jump(to: TargetPage())
    /// ```
    ///
    /// You can do something like "jump when clicking":
    ///
    /// ``` swift
    /// Button("fake button") {
    ///     // jump to the target page when clicking
    ///     jump(to: TargetPage())
    /// }
    /// ```
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    func jump<Page>(to target: Page) where Page: DefinedPage {
        DefinedViewManager.find(self).jump(to: target)
    }
    
    /// [DE] Jump to another page after a few seconds.
    ///
    /// Jump means cleaning the entire view stack and put target page at the new first level.
    /// The current page will be destroyed and collected.
    /// And you are not able to use `back()` because the target page becomes the first level page and there is no way to go back from the first level page.
    ///
    /// When you need to jump to another page, just call it in your `DefinedPage`:
    ///
    /// ``` swift
    /// // jump to the target page after 1 sec
    /// jump(to: TargetPage(), delay: 1.0)
    /// ```
    ///
    /// You can do something like "jump when clicking":
    ///
    /// ``` swift
    /// Button("fake button") {
    ///     // jump to the target page in 1 sec after clicking
    ///     jump(to: TargetPage(), delay: 1.0)
    /// }
    /// ```
    ///
    /// - Requires: The target page should conform to ``DefinedPage`` protocol.
    ///
    /// - Parameters:
    ///   - target: The target page.
    ///   - delay: The time you want to delay (in second).
    func jump<Page>(to target: Page, delay: Double) where Page: DefinedPage {
        if delay >= 0.0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                jump(to: target)
            }
        }
    }
}

// MARK: - ShortHand - Timer

extension DefinedPage {
    /// [DE] A timer. Execute as a function.
    ///
    /// - Parameters:
    ///   - delay: The time you want to delay (in second).
    ///   - execute: The code you want to execute after a few seconds.
    public func timer(delay: Double, execute: @escaping @convention(block) () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            execute()
        }
    }
}

// MARK: - Core - Process

extension DefinedPage {
    /// [DE ShouldNotUse] The body of the page view.
    ///
    /// You should implement the body on `main` instead of here.
    ///
    /// - Important: You should NOT implement anything on `body`! It will break the functionalities of everything (it is due to the original SwiftUI View system, we are planning to build our own RawView system in 2.0 release).
    public var body: some View {
        beforePageLoading()
        return process()
    }
    
    /// [DE Private] Process the page body.
    @ViewBuilder private func process() -> some View {
        ZStack {
            self.main
        }
        .onAppear(perform: onPageLoaded)
        .onDisappear(perform: onPageEnded)
        .onChange(of: self.statusBarStyle, perform: { status in
            DefinedViewManager.find(self).setStatusBarStyle(self.statusBarStyle)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DEColor.bg.light.edgesIgnoringSafeArea(.all)) // TODO: customize page background API
    }
}

#endif
