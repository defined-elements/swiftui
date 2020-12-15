//
//  DefinedTextField.swift
//
//  Created by Lingxi Li on 12/14/20.
//

import Foundation
import SwiftUI

/// DefinedElements 输入框组件
struct DefinedTextField: View {
    /// 默认值 < 非强制外部变量 >
    ///
    /// - Note: 默认值为 "Please input..." ，可以通过 def 改写。
    var def: String = "Please input..."
    
    /// 输入变量 < 强制外部变量 >
    @Binding var input: String
    
    /// 输入类型 < 强制外部变量 >
    var keyboardType: UIKeyboardType
    
    /// 文字颜色 - 默认状态 < 内部变量 >
    @State private var textColor_def: Color = Color.black
    
    /// 文字颜色 - 激活状态 < 内部变量 >
    @State private var textColor_act: Color = Color.black
    
    /// 文本框背景颜色 - 默认状态 < 内部变量 >
    @State private var backgroundColor_def: Color = Color.white
    
    /// 文本框背景颜色 - 激活状态 < 内部变量 >
    @State private var backgroundColor_act: Color = Color.white
    
    /// 边框颜色 - 默认状态 < 内部变量 >
    @State private var borderColor_def: Color = Color.white
    
    /// 边框颜色 - 激活状态 < 内部变量 >
    @State private var borderColor_act: Color = Color.white
    
    /// 水平拓展能力 < 内部变量 >
    @State private var isHorizontalExpandable: Bool = false
    
    /// 垂直拓展能力 < 内部变量 >
    @State private var isVerticalExpandable: Bool = false
    
    /// 边框宽度 - 默认状态 < 内部变量 >
    @State private var borderWidth_def: CGFloat = 1
    
    /// 边框宽度 - 激活状态 < 内部变量 >
    @State private var borderWidth_act: CGFloat = 5
    
    var body: some View {
        DefinedTextFieldModule(
            def: self.def,
            input: self.$input,
            keyboardType: self.keyboardType,
            textColor_def: self.$textColor_def,
            textColor_act: self.$textColor_act,
            backgroundColor_def: self.$backgroundColor_def,
            backgroundColor_act: self.$backgroundColor_act,
            borderColor_def: self.$borderColor_def,
            borderColor_act: self.$borderColor_act,
            isHorizontalExpandable: self.$isHorizontalExpandable,
            isVerticalExpandable: self.$isVerticalExpandable,
            borderWidth_def: self.$borderWidth_def,
            borderWidth_act: self.$borderWidth_act
        )
    }
    
    /// 赋予水平拓展能力
    ///
    /// 支持使用静态变量对水平拓展能力进行设置
    /// - Parameter value: "true" 则横向方向上支持延伸，默认为 "false" 。
    @inlinable public func setHorizontalExpandable(_ value: Bool) -> DefinedTextField {
        self.isHorizontalExpandable = value
        return self
    }
    
    /// 赋予垂直拓展能力
    ///
    /// 支持使用静态变量对垂直拓展能力进行设置
    /// - Parameter value: "true" 则垂直方向上支持延伸，默认为 "false" 。
    @inlinable public func setVerticalExpandable(_ value: Bool) -> DefinedTextField {
        self.isVerticalExpandable = value
        return self
    }
    
    /// 输入框核心部件 < 内部组件 >
    ///
    /// - Important: 该组件为 DefinedTextField 的一部分，暂不允许外部单独调用。
    private struct DefinedTextFieldModule: View {
        private let OUTER_HEIGHT: CGFloat = 65
        private let INNER_SIDE_PADDING: CGFloat = 30
        
        /// 默认值 < 非强制外部变量 >
        var def: String
        
        /// 输入变量 < 强制外部变量 >
        @Binding var input: String
        
        /// 输入类型 < 强制外部变量 >
        var keyboardType: UIKeyboardType
        
        /// 文字颜色 - 默认状态 < 内部变量 >
        @Binding var textColor_def: Color
        
        /// 文字颜色 - 激活状态 < 内部变量 >
        @Binding var textColor_act: Color
        
        /// 文本框背景颜色 - 默认状态 < 内部变量 >
        @Binding var backgroundColor_def: Color
        
        /// 文本框背景颜色 - 激活状态 < 内部变量 >
        @Binding var backgroundColor_act: Color
        
        /// 边框颜色 - 默认状态 < 内部变量 >
        @Binding var borderColor_def: Color
        
        /// 边框颜色 - 激活状态 < 内部变量 >
        @Binding var borderColor_act: Color
        
        /// 水平拓展能力 < 内部变量 >
        @Binding var isHorizontalExpandable: Bool
        
        /// 垂直拓展能力 < 内部变量 >
        @Binding var isVerticalExpandable: Bool
        
        /// 边框宽度 - 默认状态 < 内部变量 >
        @Binding var borderWidth_def: CGFloat
        
        /// 边框宽度 - 激活状态 < 内部变量 >
        @Binding var borderWidth_act: CGFloat
        
        /// - TODO: 边框
        var body: some View {
            TextField(def, text: $input)
                .padding(.horizontal, INNER_SIDE_PADDING)
                .font(Fonts.body.bold())
                .foregroundColor(textColor_def)
                .frame(maxWidth: .infinity,
                       minHeight: OUTER_HEIGHT,
                       maxHeight: isVerticalExpandable ? .infinity : OUTER_HEIGHT)
                .background(RoundedRectangle(cornerRadius: Defined.Dimens.CORNER_STR)
                                .foregroundColor(backgroundColor_def))
                .keyboardType(keyboardType)
        }
    }
}
