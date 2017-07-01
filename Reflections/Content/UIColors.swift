import UIKit

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
            
        }
        
        struct Red {
            
        }
        
        struct Blue {
            
        }
        
        struct Yellow {
            
        }
        
        struct Green {
            
        }
        
        struct Pink {
            
        }
        
        struct Gray {
            
        }
        
        struct White {
            
        }
        
        struct Black {
            static let Licorice = UIColor.init(hex: 0x262626)
        }
        
    }
    
}
