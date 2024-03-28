import UIKit.UIFont

//MARK: - Enum with Manrope font's styles to use to fallowing extension UIFont class

enum RubikFontStyle: String {
    case extraBold = "Rubik-ExtraBold"
    case bold = "Rubik-Bold"
    case semiBold = "Rubik-SemiBold"
    case medium = "Rubik-Medium"
    case regular = "Rubik-Regular"
    case light = "Rubik-Light"
}


//MARK: - Extenion to add new system font to UIFont class

extension UIFont {
    
    static func manrope(ofSize size: CGFloat, style: RubikFontStyle) -> UIFont {
        return UIFont(name: style.rawValue, size: size) ?? .systemFont(ofSize: size)
    }
}
