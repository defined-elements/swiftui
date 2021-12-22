import SwiftUI

///
public class LazyString: LazyData {
    @Published public var value: String
    
    @Published public var stringValue: String
    
    @Published public var status: GeneralStatus = .default
    
    /// [DE] Create a lazy string with loading status in default.
    ///
    /// It means that when you create it, it does not have anything in it.
    /// So, it will appear as a loading type.
    /// And you SHOULD update it once it has been loaded.
    public init() {
        self.value = ""
        self.stringValue = ""
        self.status = .loading
    }
    
    /// [DE] Create a lazy string with default value.
    ///
    /// You can still update it later if you need to.
    ///
    /// - Parameter def: The default string value.
    /// - Parameter defStatus: The default status once it is created.
    public required init(_ def: String, defStatus: GeneralStatus = .default) {
        self.value = def
        self.stringValue = def
        self.status = defStatus
    }
    
    public func update(_ value: String) {
        withAnimation(DefinedAnimation.spring) {
            self.value = value
            self.stringValue = value
            self.status = .done
        }
    }
    
    public func update(status: GeneralStatus) {
        withAnimation(DefinedAnimation.spring) {
            self.status = .done
        }
    }
    
    public func update(_ value: String, status: GeneralStatus) {
        withAnimation(DefinedAnimation.spring) {
            self.value = value
            self.stringValue = value
            self.status = status
        }
    }
}

extension String.StringInterpolation {
    mutating func appendInterpolation(_ value: LazyString) {
        print("INTERPOLATION.")
        appendLiteral("\(value.stringValue)")
    }
}
