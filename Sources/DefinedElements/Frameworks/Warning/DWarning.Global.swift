//
//  File.swift
//  
//
//  Created by Lingxi Li on 6/14/21.
//

import Foundation

///
public struct DefinedWarning : DefinedPotentialWarning {
    var name: String
    
    public init(from: String? = nil, _ message: String) {
        self.name = from ?? "<Global>"
        
        self.warning(message)
    }
}
