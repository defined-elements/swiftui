import SwiftUI

/// ScrollReader - 滚动捕捉器
struct ScrollReader: View {
    ///
    @Binding var contentOffset: CGPoint
    
    ///
    init(_ target: Binding<CGPoint>) {
        self._contentOffset = target
    }
    
    ///
    var body: some View {
        GeometryReader { reader in
            Color.clear
                .frame(height: 0)
                .onChange(of: reader.frame(in: .global).minY, perform: { value in
                    self.contentOffset = CGPoint(x: self.contentOffset.x, y: floor(-value * 10000.0) / 10000.0) /* 仅需万位精度 */
                })
        }
    }
}
