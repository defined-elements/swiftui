//
//  DefinedButton.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/16/20.
//

import Foundation
import SwiftUI

/// DefinedButton
public struct DefinedButton<Content: View>: View {
    /// 当前按钮状态
    @Binding public var status: DefinedButtonStatus
    
    /// 点击事件
    public var action: () -> Void
    
    @State private var backgroundColor_disabled: Color = Colors.BG_DISABLED.get()
    @State private var backgroundColor_normal: Color = Colors.BG_BLUE.get()
    @State private var backgroundColor_loading: Color = Colors.BG_BLUE.get()
    @State private var backgroundColor_done: Color = Colors.BG_BLUE.get()
    
    /// 按钮内容
    public var content: (_: DefinedButtonStatus) -> Content
    
    /// DefinedButton 构造器 1
    ///
    /// - Parameters:
    ///   - action: 点击 Button 时的动作。
    ///   - status: 状态 Binding 。
    ///   - content: Button 的内容，不带动态 Status 参数回传。
    public init(action: @escaping () -> Void = {},
                status: Binding<DefinedButtonStatus> = .constant(.normal),
                @ViewBuilder content: @escaping () -> Content) {
        self.action = action
        self._status = status
        self.content = { status in
            content()
        }
    }
    
    /// DefinedButton 构造器 2
    ///
    /// - Parameters:
    ///   - action: 点击 Button 时的动作。
    ///   - status: 状态 Binding 。
    ///   - content: Button 的内容，带有动态 Status 参数回传。
    public init(action: @escaping () -> Void = {},
                status: Binding<DefinedButtonStatus> = .constant(.normal),
                @ViewBuilder content: @escaping (_: DefinedButtonStatus) -> Content) {
        self.action = action
        self._status = status
        self.content = content
    }
    
    /**
     Body 部署开始
     */
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            self.content(status)
            
            if (status == .disabled) {
                
            } else if (status == .loading) {
                
            } else if (status == .done) {
                
            }
        }
        .onTapGesture {
            self.action()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: Dimens.CORNER_STR.get())
                        .foregroundColor(
                            // 禁用状态
                            self.status == .disabled ? backgroundColor_disabled :
                            // 加载状态
                            self.status == .loading ? backgroundColor_loading :
                            // 完成状态
                            self.status == .done ? backgroundColor_done :
                            // 默认状态
                            backgroundColor_normal
                        ))
    }
    
    /**
     Setter 部署开始
     */
    
    /// 设置自定义背景颜色
    public func backgroundColor(disabled: Color? = nil,
                                normal: Color? = nil,
                                loading: Color? = nil,
                                done: Color? = nil) -> DefinedButton {
        if (disabled != nil) {
            self.backgroundColor_disabled = disabled!
        }
        if (normal != nil) {
            self.backgroundColor_normal = normal!
        }
        if (loading != nil) {
            self.backgroundColor_loading = loading!
        }
        if (done != nil) {
            self.backgroundColor_done = done!
        }
        return self
    }
}

/// 按钮状态预设
public enum DefinedButtonStatus {
    /// 禁用状态
    case disabled
    
    /// 默认状态
    case normal
    
    /// 加载状态（通常会有专门的加载指示动画）
    case loading
    
    /// 完成状态（通常会有定时显示或永久显示的完成指示）
    case done
}

struct DefinedButton_Previews: PreviewProvider {
    @State static var buttonStatusTest: DefinedButtonStatus = .disabled
    static var previews: some View {
        DefinedButton() {
            Text("hhh")
            Text("hhhh2")
        }
        .backgroundColor(normal: Color.gray)
        .padding(20)
    }
}
