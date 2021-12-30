//
//  File.swift
//  
//
//  Created by Lingxi Li on 4/21/21.
//

import Foundation

///
class CoverHeaderObserver : ObservableObject {
    ///
    @Published var coverObs: CoverObserver? = nil
    
    ///
    @Published var headerObs: HeaderObserver? = nil
}
