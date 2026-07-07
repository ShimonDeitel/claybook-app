import SwiftUI

enum Theme {
    static let background = Color(red: 0.141, green: 0.094, blue: 0.149)
    static let accent = Color(red: 0.816, green: 0.420, blue: 0.659)
    static let ink = Color(red: 0.973, green: 0.925, blue: 0.957)
    static let warm = Color(red: 0.373, green: 0.722, blue: 0.651)
    static let fontDesign: Font.Design = .rounded

    static func title(_ size: CGFloat = 28) -> Font {
        .system(size: size, weight: .bold, design: fontDesign)
    }
    static func body(_ size: CGFloat = 16) -> Font {
        .system(size: size, weight: .regular, design: fontDesign)
    }
    static func label(_ size: CGFloat = 13) -> Font {
        .system(size: size, weight: .semibold, design: fontDesign)
    }
}
