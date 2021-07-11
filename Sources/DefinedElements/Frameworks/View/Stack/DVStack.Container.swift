#if os(iOS)

import Foundation

/// [DE Internal] A view stack container instance holding page elements.
internal struct DefinedViewStackContainer {
    /// The stack instance holding page elements.
    var stack = [DefinedViewStackElement]()
    
    /// The count of elements in this container.
    var count: Int {
        return stack.count
    }
    
    /// [DE Internal] Get the stack directly.
    ///
    /// - Note: For `elements` property updating purpose only!
    internal func getStack() -> [DefinedViewStackElement] {
        return stack
    }
    
    /// [DE Internal] Push a page element onto the stack.
    mutating func push(_ target: DefinedViewStackElement) {
        guard stack.firstIndex(of: target) == nil else {
            // if there exists a page element having same id with target page, it means that something went wrong.
            // we should never push the same page twice (we can have different instances of the same page, but no exactly same page instance).
            return
        }
        stack.append(target)
    }
    
    /// [DE Internal] Pop a page element onto the stack.
    ///
    /// We do NOT return the element since it becomes totally useless once it has been popped.
    /// There makes no sense to get it back outside.
    mutating func pop() {
        _ = stack.popLast()
    }
    
    /// [DE Internal] Clean the entire container.
    mutating func removeAll() {
        stack.removeAll()
    }
}

#endif
