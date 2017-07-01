import UIKit
import Foundation

class BackgroundColors {
    
    let backgroundColors = [UIColor.CustomColor.Red.Fuzzy, UIColor.CustomColor.Orange.BigFoot ,UIColor.CustomColor.Blue.Liberty, UIColor.CustomColor.Blue.Sapphire,
                            UIColor.CustomColor.Yellow.Tan, UIColor.CustomColor.Yellow.Grain, UIColor.CustomColor.Green.LightSea, UIColor.CustomColor.Gray.SilverSand,
                            UIColor.CustomColor.White.Gainsboro, UIColor.CustomColor.White.DustStorm, UIColor.CustomColor.Violet.GlossyGrape]
    
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
        }
        
        struct Red {
            static let Fuzzy = UIColor.init(hex: 0xC1666B)
        }
        
        struct Orange {
            static let BigFoot = UIColor.init(hex: 0xEE964B)
        }
        
        struct Blue {
            static let Liberty = UIColor.init(hex: 0x4357AD)
            static let Sapphire = UIColor.init(hex: 0x19647E)
        }
        
        struct Yellow {
            static let Tan = UIColor.init(hex: 0xD4B483)
            static let Grain = UIColor.init(hex: 0xF4D35E)
        }
        
        struct Green {
            static let LightSea = UIColor.init(hex: 0x28AFB0)
        }
        
        struct Pink {
            
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
