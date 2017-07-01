import UIKit
import Foundation

class BackgroundColors {
    
    let backgroundColors = [UIColor.CustomColor.Red.Fuzzy, UIColor.CustomColor.Orange.BigFoot ,UIColor.CustomColor.Blue.Liberty, UIColor.CustomColor.Blue.Sapphire,
                            UIColor.CustomColor.Blue.Turquoise, UIColor.CustomColor.Yellow.GoldenRod, UIColor.CustomColor.Yellow.Sandstorm, UIColor.CustomColor.Green.Tea,
                            UIColor.CustomColor.Yellow.Tan, UIColor.CustomColor.Yellow.Grain, UIColor.CustomColor.Green.LightSea, UIColor.CustomColor.Green.AquaMarine,
                            UIColor.CustomColor.Gray.SilverSand, UIColor.CustomColor.Pink.Thistle, UIColor.CustomColor.Pink.WildWatermelon, UIColor.CustomColor.Green.Pastel,
                            UIColor.CustomColor.White.Gainsboro, UIColor.CustomColor.White.DustStorm, UIColor.CustomColor.Violet.GlossyGrape, UIColor.CustomColor.Violet.Taupe]
    
    // #D84797 the start button
    
}

extension UIColor {
    
    convenience init(hex: Int, alpha: CGFloat? = 1.0) {
        let hexRed = CGFloat((hex >> 16) & 0xff) / 255.0
        let hexGreen = CGFloat((hex >> 8) & 0xff) / 255.0
        let hexBlue = CGFloat(hex & 0xff) / 255.0
        let alphaValue = alpha ?? 1.0
        
        self.init(red: hexRed, green: hexGreen, blue: hexBlue, alpha: alphaValue)
    }
    
    struct CustomColor {
        
        struct Violet {
            static let GlossyGrape = UIColor.init(hex: 0xB58DB6)
            static let Taupe = UIColor.init(hex: 0x474056)
        }
        
        struct Red {
            static let Fuzzy = UIColor.init(hex: 0xC1666B)
        }
        
        struct Orange {
            static let BigFoot = UIColor.init(hex: 0xEE964B)
            static let Fawn = UIColor.init(hex: 0xDBAD6A)
        }
        
        struct Blue {
            static let Liberty = UIColor.init(hex: 0x4357AD)
            static let Sapphire = UIColor.init(hex: 0x19647E)
            static let Turquoise = UIColor.init(hex: 0x41EAD4)
        }
        
        struct Yellow {
            static let Tan = UIColor.init(hex: 0xD4B483)
            static let Grain = UIColor.init(hex: 0xF4D35E)
            static let GoldenRod = UIColor.init(hex: 0xEDDEA4)
            static let Sandstorm = UIColor.init(hex: 0xEAD94C)
        }
        
        struct Green {
            static let LightSea = UIColor.init(hex: 0x28AFB0)
            static let AquaMarine = UIColor.init(hex: 0x8DFFCD)
            static let Pastel = UIColor.init(hex: 0x7DCD85)
            static let Tea = UIColor.init(hex: 0xC2F8CB)
        }
        
        struct Pink {
            static let Thistle = UIColor.init(hex: 0xE0BAD7)
            static let WildWatermelon = UIColor.init(hex: 0xED6B86)
        }
        
        struct Gray {
            static let SilverSand = UIColor.init(hex: 0xBFCBC2)
        }
        
        struct White {
            static let Gainsboro = UIColor.init(hex: 0xE4DFDA)
            static let DustStorm = UIColor.init(hex: 0xD8CBC7)
        }
        
        struct Black {
            static let Licorice = UIColor.init(hex: 0x262626)
        }
        
    }
    
}
