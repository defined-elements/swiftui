import SwiftUI

/// [DE] A view containing some text or lazy text (it supports lazy data).
///
/// The default `DefinedText` has the preset of `body`.
/// If you want to use another preset, you can either set it in the initializer:
///
///     DefinedText("...", preset: .title)
///
/// or set it by calling the modifier:
///
///     DefinedText("...")
///         .preset(.title)
///
/// - TODO: Fix problematic Lazy support.
/// - TODO: Status support (not just lazy status).
public struct DefinedText : DefinedView {
    /// The text placing into the view.
    @Binding var text: String
    
    /// The status for lazy data.
    @Binding public var status: GeneralStatus
    
    /// The default width for the placeholder of loading status or error status.
    var defWidth: CGFloat
        
    /// The preset for text style.
    var preset: DefinedTextPreset = .body
    
    /// The text color when status is `default`.
    var textColor_def: Color = DEColor.text.dark_1
    
    /// The text color when status is `loading`.
    var textColor_loading: Color = DEColor.bg.disabled
    
    /// The text color when status is `active`.
    var textColor_act: Color = DEColor.main.black
    
    /// The text color when status is `done`.
    var textColor_done: Color = DEColor.main.black
    
    /// The text color when status is `error`.
    var textColor_error: Color = DEColor.bg.disabled
    
    /// The text color when status is `disabled`.
    var textColor_disabled: Color = DEColor.bg.disabled
    
    /// [Internal] The main text view.
    ///
    /// - Note: It is rendered while initializing.
    ///
    /// - Important: It should not be accessed from outside. It is for internal render holding only!
    private var textView: AnyView = AnyView(EmptyView())
    
    /// [DE] Create a view with a static text content.
    ///
    /// - Parameters:
    ///   - text: The content.
    ///   - status: The status it should be. (Different status have different styles other than different presets)
    ///   - preset: The preset you want to set.
    ///   - color: The text color.
    public init(
        _ text: String,
        status: GeneralStatus = .default,
        preset: DefinedTextPreset = .body,
        color: Color = DEColor.text.black
    ) {
        self._text = Binding(get: { text }, set: { value in /* do nothing */ })
        self._status = Binding(get: { status }, set: { value in /* do nothing */ })
        self.defWidth = 0
        self.preset = preset
        self.textColor_def = color
        self.textView = AnyView(preset.render(view: Text(self.text)))
    }
    
    /// [Problematic] Create a view with a lazy-loading text content.
    public init<Lazy: LazyData>(
        _ lazy: ObservedObject<Lazy>,
        preset: DefinedTextPreset = .body,
        defWidth: CGFloat = 55
    ) {
        self._text = lazy.projectedValue.stringValue
        self._status = lazy.projectedValue.status
        self.defWidth = defWidth
        self.preset = preset
        self.textView = AnyView(preset.render(view: Text(self.text)))
    }
    
    /// [Problematic] Create a view with a binding text content.
    public init(
        _ lazy: Binding<String>,
        status: Binding<GeneralStatus> = .constant(.done),
        preset: DefinedTextPreset = .body,
        defWidth: CGFloat = 55
    ) {
        self._text = lazy
        self._status = status
        self.defWidth = defWidth
        self.preset = preset
        self.textView = AnyView(preset.render(view: Text(self.text)))
    }
    
    /// [Internal] For modifier only.
    init(
        originalView: DefinedText,
        text: Binding<String>? = nil,
        status: Binding<GeneralStatus>? = nil,
        defWidth: CGFloat? = nil,
        preset: DefinedTextPreset? = nil,
        textColor_def: Color? = nil,
        textColor_loading: Color? = nil,
        textColor_act: Color? = nil,
        textColor_done: Color? = nil,
        textColor_error: Color? = nil,
        textColor_disabled: Color? = nil
    ) {
        self._text = text ?? originalView.$text
        self._status = status ?? originalView.$status
        self.defWidth = defWidth ?? originalView.defWidth
        self.preset = preset ?? originalView.preset
        self.textColor_def = textColor_def ?? originalView.textColor_def
        self.textColor_loading = textColor_loading ?? originalView.textColor_loading
        self.textColor_act = textColor_act ?? originalView.textColor_act
        self.textColor_done = textColor_done ?? originalView.textColor_done
        self.textColor_error = textColor_error ?? originalView.textColor_error
        self.textColor_disabled = textColor_disabled ?? originalView.textColor_disabled
        self.textView = AnyView(self.preset.render(view: Text(self.text)))
    }
    
    /// Body
    public var body: some View {
        if self.status == .none {
            EmptyView()
        } else if self.status == .loading {
            RoundedRectangle(cornerRadius: 13.0, style: .continuous)
                .frame(width: self.defWidth, height: self.preset.size + CGFloat(8))
                .frame(alignment: .center)
                .foregroundColor(self.textColor_loading)
        } else if self.status == .disabled {
            // TODO: for disabled status (with disabled icon)
        } else {
            self.textView
                .foregroundColor(
                    self.status == .done ? self.textColor_done : (
                        self.status == .error ? self.textColor_error : (
                            self.textColor_def
                        )
                    )
                )
                .frame(alignment: .center)
        }
    }
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        DefinedText("Hello World!")
            .preset(.body)
            .fontSize(18)
            .fontWeight(.black)
            .frame(maxWidth: .infinity)
    }
}


// TODO: We may be able to achieve that in the future. But not now.

//public enum DefinedTextSourse {
//    case string(String)
//    case lazyString(LazyString)
//
//    var a: String {
//        switch(self) {
//        case .string(let str): return str
//        case .lazyString(let lazystr): return lazystr.stringValue
//        }
//    }
//
//    var b: LazyString {
//        switch(self) {
//        case .string(let str): return LazyString(str)
//        case .lazyString(let lazystr): return lazystr
//        }
//    }
//}
