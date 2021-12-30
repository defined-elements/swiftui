import SwiftUI

///
struct DefinedDivider : DefinedView {
    public var body: some View {
        Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: DEDimen.divider.thickness)
            .foregroundColor(DEColor.divider.grey_1.opa())
    }
}
