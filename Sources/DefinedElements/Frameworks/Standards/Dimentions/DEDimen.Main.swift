import Foundation
import SwiftUI

/// DEDimen - 预置尺寸
public class DEDimen {
    /// 圆角标准
    public class corner {
        /// 圆角 - 标准
        public static let std: CGFloat = 16
        
        /// 圆角 - 标准
        public static let small: CGFloat = 8
    }
    
    /// 顶栏标准
    public class header {
        /// 顶栏返回安全区域 - 标准
        public static let back_area: CGFloat = 64
        
        /// 顶栏两侧安全区域 - 标准
        public static let side_area: CGFloat = 26
    }
    
    ///
    public class content {
        ///
        public static let streamPadding: CGFloat = 30
        
        ///
        public static let streamPadding_wide: CGFloat = 16
        
        ///
        public static let streamPadding_contract: CGFloat = 36
    }
    
    ///
    public class border {
        ///
        public static let width: CGFloat = 0.5
    }
    
    ///
    public class divider {
        ///
        public static let length: CGFloat = .infinity

        ///
        public static let thickness: CGFloat = 0.5
        
        /// 装饰分割线
        public class deco {
            ///
            public static let length: CGFloat = 80
            
            ///
            public static let thickness: CGFloat = 2.6
        }
    }
}
