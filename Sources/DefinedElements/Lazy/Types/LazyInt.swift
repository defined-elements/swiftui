import SwiftUI

///
public class LazyInt: LazyData {
    ///
    @Published public var value: Int
    
    ///
    @Published public var stringValue: String
    
    ///
    @Published public var status: GeneralStatus = .default
    
    ///
    public required init(_ def: Int, defStatus: GeneralStatus = .default) {
        self.value = def
        self.stringValue = "\(def)"
        self.status = defStatus
    }
    
    ///
    public func update(_ value: Int, status: GeneralStatus = .default) {
        self.value = value
        self.stringValue = "\(value)"
        self.status = status
    }
}
