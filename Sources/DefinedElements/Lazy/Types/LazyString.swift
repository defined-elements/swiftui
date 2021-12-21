import SwiftUI

///
public class LazyString: LazyData {
    ///
    @Published public var value: String
    
    ///
    @Published public var stringValue: String
    
    ///
    @Published public var status: GeneralStatus = .default
    
    ///
    public required init(_ def: String, defStatus: GeneralStatus = .default) {
        self.value = def
        self.stringValue = def
        self.status = defStatus
    }
    
    ///
    public func update(_ value: String, status: GeneralStatus = .default) {
        self.value = value
        self.stringValue = value
        self.status = status
    }
}
