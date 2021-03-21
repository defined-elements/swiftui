//
//  DefinedText.swift
//  CyberCurrency
//
//  Created by Lingxi Li on 12/19/20.
//

import Foundation
import SwiftUI

/// This extension is to extend the definedStyle() method for Text and TextPreset
extension Text {
    /// 调用 style() 时括号内传入的参数请参考 TextPreset
    public func style(_ preset: TextPreset = .body, bold: Bool = false) -> some View {
        textModifier(preset: preset, bold: bold)
    }
    
    ///
    private func textModifier(preset: TextPreset, bold: Bool) -> some View {
        switch preset {
        
        case TextPreset.title:
            return self
                .font(Fonts.title)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        case TextPreset.semiTitle:
            return self
                .font(Fonts.semiTitle)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        case TextPreset.thirdTitle:
            return self
                .font(Fonts.thirdTitle)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())

        case TextPreset.subTitle:
            return self
                .font(Fonts.subTitle)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())

        case TextPreset.buttonMain:
            return self
                .font(Fonts.buttonMain)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())

        case TextPreset.body:
            return self
                .font(Fonts.body)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        case TextPreset.content:
            return self
                .font(Fonts.content)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        case TextPreset.note:
            return self
                .font(Fonts.note)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
            
        case TextPreset.number:
            return self
                .font(Fonts.number)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        case TextPreset.numberNote:
            return self
                .font(Fonts.numberNote)
                .tracking(FontDimens.DEFAULT_TRACKING.get())
                .lineSpacing(FontDimens.DEFAULT_LINE_SPACING.get())
        }
    }
}

///
public enum TextPreset {
    case title
    case semiTitle
    case thirdTitle
    
    /// 副标题（搭配主标题使用，并非用作次级主标题）
    case subTitle
    
    case buttonMain
    
    case body
    case content
    case note
    
    case number
    case numberNote
}


struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        Text("你好呀哈哈哈 Testtt 500")
            .style(.title)
            .frame(maxWidth: .infinity)
    }
}
