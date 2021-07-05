#if os(iOS)

import Foundation

/// [DE Internal]
struct DefinedViewStackContainer {
    ///
    var stack = [DefinedViewStackElement]()
    
    var count: Int {
        return stack.count
    }
    
    ///
    func getStack() -> [DefinedViewStackElement] {
        return stack
    }
    
    ///
    mutating func push(_ target: DefinedViewStackElement) {
        guard stack.firstIndex(of: target) == nil else {
            // 不同层级间重复出现的Page
            return
        }
        stack.append(target)
    }
    
    ///
    mutating func pop() {
        _ = stack.popLast()
    }
    
    ///
    mutating func removeAll() {
        stack.removeAll()
    }
}

#endif
