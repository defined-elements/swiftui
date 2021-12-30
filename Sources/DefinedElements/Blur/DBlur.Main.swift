import SwiftUI

#if os(iOS)

/// [DE] Blur Module
/// Inspired by: https://github.com/twostraws/VisualEffects/blob/main/Sources/VisualEffects/VisualEffectBlur-iOS.swift
///
/// - TODO: Rebuild it with DefinedView module.
/// - TODO: Make the macOS version
public struct DefinedBlur<Content: View> : DefinedView {
    /// Defaults to .systemMaterial
    var blurStyle: UIBlurEffect.Style

    /// Defaults to nil
    var vibrancyStyle: UIVibrancyEffectStyle?

    var content: Content

    public init(blurStyle: UIBlurEffect.Style = .systemMaterial,
                vibrancyStyle: UIVibrancyEffectStyle? = nil,
                @ViewBuilder content: () -> Content) {
        self.blurStyle = blurStyle
        self.vibrancyStyle = vibrancyStyle
        self.content = content()
    }

    public var body: some View {
        DefinedBlurRepresentable()
        
//        Representable(
//            blurStyle: blurStyle,
//            vibrancyStyle: vibrancyStyle,
//            content: ZStack { content }
//        )
//        .accessibility(hidden: Content.self == EmptyView.self)
    }
}

// MARK: - Representable

extension DefinedBlur {
    struct Representable<Content: View>: UIViewRepresentable {
        var blurStyle: UIBlurEffect.Style
        var vibrancyStyle: UIVibrancyEffectStyle?
        var content: Content

        func makeUIView(context: Context) -> UIVisualEffectView {
            context.coordinator.blurView
        }

        func updateUIView(_ view: UIVisualEffectView, context: Context) {
            context.coordinator.update(content: content, blurStyle: blurStyle, vibrancyStyle: vibrancyStyle)
        }

        func makeCoordinator() -> Coordinator {
            Coordinator(content: content)
        }
    }
}

// MARK: - Coordinator

extension DefinedBlur.Representable {
    class Coordinator {
        let blurView = UIVisualEffectView()
        let vibrancyView = UIVisualEffectView()
        let hostingController: UIHostingController<Content>

        init(content: Content) {
            hostingController = UIHostingController(rootView: content)
            hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            hostingController.view.backgroundColor = nil
            blurView.contentView.addSubview(vibrancyView)

            blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            vibrancyView.contentView.addSubview(hostingController.view)
            vibrancyView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }

        func update(content: Content, blurStyle: UIBlurEffect.Style, vibrancyStyle: UIVibrancyEffectStyle?) {
            hostingController.rootView = content

            let blurEffect = UIBlurEffect(style: blurStyle)
            blurView.effect = blurEffect

            if let vibrancyStyle = vibrancyStyle {
                vibrancyView.effect = UIVibrancyEffect(blurEffect: blurEffect, style: vibrancyStyle)
            } else {
                vibrancyView.effect = nil
            }

            hostingController.view.setNeedsDisplay()
        }
    }
}

// MARK: - Content-less Initializer

public extension DefinedBlur where Content == EmptyView {
    init(blurStyle: UIBlurEffect.Style = .systemMaterial) {
        self.init(blurStyle: blurStyle, vibrancyStyle: nil) {
            EmptyView()
        }
    }
}
#endif

public struct DefinedBlurRepresentable: UIViewRepresentable {
    public func makeUIView(context: UIViewRepresentableContext<DefinedBlurRepresentable>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)

        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor),
            blurView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blurView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])

        return view
    }

    public func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<DefinedBlurRepresentable>) {
        guard let effectView = uiView.subviews.first as? UIVisualEffectView else { return }
        let blurEffect = UIBlurEffect(style: context.environment.colorScheme == .dark ? .dark : .light)
        effectView.effect = blurEffect

    }
}
