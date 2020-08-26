//
//  Theme.swift
//  CoronaApp
//
//  Created by عمر سعيد الشمري on 24/03/2020.
//  Copyright © 2020 Ministry of Health. All rights reserved.
//

import UIKit

public struct Theme {
    
    @nonobjc public static var navBackgroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "navBackgroundColor")!
        }
        return .co_whiteTwo
    }
    
    @nonobjc public static var navForegroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "navForegroundColor")!
        }
        return .co_black
    }
    
    @nonobjc public static var backgroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "backgroundColor")!
        }
        return .co_white
        
    }
    @nonobjc public static var foregroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "foregroundColor")!
        }
        return .co_black
    }
    @nonobjc public static var secondaryForegroundColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "secondaryForegroundColor")!
        }
        return UIColor.co_black.withAlphaComponent(0.7)
        
    }
    @nonobjc public static var imageTintColor: UIColor {
        if #available(iOS 11.0, *) {
            return UIColor.init(named: "ImageTintColor")!
        }
        return UIColor.co_black.withAlphaComponent(0.7)
    }
    
    @nonobjc public static var buttonBackgroundColor: UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.secondarySystemFill
        } else {
            return .co_paleGrey
        }
    }
}

public extension UIColor {
    
    class func color(rgbHex: UInt) -> UIColor {
        return UIColor(rgbHex: rgbHex)
    }
    
    convenience init(rgbHex value: UInt) {
        let red = CGFloat(((value >> 16) & 0xff)) / 255.0
        let green = CGFloat(((value >> 8) & 0xff)) / 255.0
        let blue = CGFloat(((value >> 0) & 0xff)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

public extension UIColor {

  @nonobjc class var co_white: UIColor {
    return UIColor(white: 242.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_dark: UIColor {
    return UIColor(red: 19.0 / 255.0, green: 24.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_almostBlack: UIColor {
    return UIColor(red: 15.0 / 255.0, green: 19.0 / 255.0, blue: 24.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_black: UIColor {
    return UIColor(white: 58.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_black20: UIColor {
    return UIColor(white: 0.0, alpha: 0.2)
  }

  @nonobjc class var co_blueGreen: UIColor {
    return UIColor(red: 0.0, green: 131.0 / 255.0, blue: 117.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_jungleGreen: UIColor {
    return UIColor(red: 7.0 / 255.0, green: 150.0 / 255.0, blue: 69.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_orangeYellow: UIColor {
    return UIColor(red: 243.0 / 255.0, green: 157.0 / 255.0, blue: 0.0, alpha: 1.0)
  }

  @nonobjc class var co_deepRed: UIColor {
    return UIColor(red: 155.0 / 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
  }

  @nonobjc class var co_orangeyRed: UIColor {
    return UIColor(red: 1.0, green: 59.0 / 255.0, blue: 48.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_warmBlue: UIColor {
    return UIColor(red: 88.0 / 255.0, green: 86.0 / 255.0, blue: 214.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_marigold: UIColor {
    return UIColor(red: 1.0, green: 204.0 / 255.0, blue: 0.0, alpha: 1.0)
  }

  @nonobjc class var co_reddishPink: UIColor {
    return UIColor(red: 1.0, green: 45.0 / 255.0, blue: 85.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_tangerine: UIColor {
    return UIColor(red: 1.0, green: 149.0 / 255.0, blue: 0.0, alpha: 1.0)
  }

  @nonobjc class var co_deepSkyBlue: UIColor {
    return UIColor(red: 0.0, green: 122.0 / 255.0, blue: 1.0, alpha: 1.0)
  }
    


  @nonobjc class var co_robinSEgg: UIColor {
    return UIColor(red: 90.0 / 255.0, green: 200.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_weirdGreen: UIColor {
    return UIColor(red: 76.0 / 255.0, green: 217.0 / 255.0, blue: 100.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_paleGrey: UIColor {
    return UIColor(red: 239.0 / 255.0, green: 239.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_paleLilac: UIColor {
    return UIColor(red: 229.0 / 255.0, green: 229.0 / 255.0, blue: 234.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_blueGrey: UIColor {
    return UIColor(red: 142.0 / 255.0, green: 142.0 / 255.0, blue: 147.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_lightBlueGrey: UIColor {
    return UIColor(red: 199.0 / 255.0, green: 199.0 / 255.0, blue: 204.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_blackTwo: UIColor {
    return UIColor(white: 0.0, alpha: 1.0)
  }

  @nonobjc class var co_lightBurgundy: UIColor {
    return UIColor(red: 183.0 / 255.0, green: 55.0 / 255.0, blue: 63.0 / 255.0, alpha: 1.0)
  }

  @nonobjc class var co_sea: UIColor {
    return UIColor(red: 54.0 / 255.0, green: 163.0 / 255.0, blue: 154.0 / 255.0, alpha: 1.0)
  }
    
  @nonobjc class var co_sea_light: UIColor {
      return UIColor(red: 58.0 / 255.0, green: 204.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0)
  }
  
  @nonobjc class var co_lightSea: UIColor {
      return UIColor(red: 235.0 / 255.0, green: 245.0 / 255.0, blue: 244.0 / 255.0, alpha: 1.0)
  }
    

  @nonobjc class var co_whiteTwo: UIColor {
    return UIColor(white: 1.0, alpha: 1.0)
  }

    @nonobjc class var co_darkGreen: UIColor {
        return UIColor(red: 19.0 / 255.0, green: 129.0 / 255.0, blue: 119.0 / 255.0, alpha: 1.0)
    }

    @nonobjc class var co_darkBlue: UIColor {
        return UIColor(red: 19.0 / 255.0, green: 94.0 / 255.0, blue: 129.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var co_dustyOrange: UIColor {
       return UIColor(red: 231.0 / 255.0, green: 132.0 / 255.0, blue: 55.0 / 255.0, alpha: 1.0)
     }
    
    @nonobjc class var co_bluishGreen: UIColor {
      return UIColor(red: 11.0 / 255.0, green: 164.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var co_darkRed: UIColor {
      return UIColor(red: 138.0 / 255.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }
    @nonobjc class var co_deepRedTwo: UIColor {
      return UIColor(red: 163.0 / 255.0, green: 3.0 / 255.0, blue: 3.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var co_grapePurple: UIColor {
      return UIColor(red: 133.0 / 255.0, green: 38.0 / 255.0, blue: 60.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var co_darkGreyBlue56: UIColor {
      return UIColor(red: 57.0 / 255.0, green: 105.0 / 255.0, blue: 103.0 / 255.0, alpha: 0.56)
    }
    
    //-----------------------------Health Cases----------------------------------
    @nonobjc class var co_hc_yellow: UIColor {
        return UIColor(hex: "#ffdd00")
    }
    
    @nonobjc class var co_lightBlue: UIColor {
              return UIColor(hex: "#3D32D2")
          }
    @nonobjc class var co_hc_brown: UIColor {
        return UIColor(hex: "#ad7236")
    }
    @nonobjc class var co_hc_orange: UIColor {
        return UIColor(hex: "#ff9900")
    }
    @nonobjc class var co_hc_green: UIColor {
        return UIColor(hex: "#0BA456")
    }
    
    @nonobjc class var co_red: UIColor {
        return UIColor(hex: "#E82f4E")
    }
    @nonobjc class var co_green: UIColor {
      return UIColor(hex: "#0BA358")
    }
    @nonobjc class var co_yellow_bg: UIColor {
      return UIColor(hex: "#FFFFED")
    }
    
    @nonobjc class var co_font_yellow: UIColor {
      return UIColor(hex: "#f6a100")
    }
    
     @nonobjc class var co_font_red: UIColor {
       return UIColor(hex: "#ff4040")
     }
    
    @nonobjc class var co_light_blue: UIColor {
         return UIColor(hex: "#1B9EE3")
       }
    @nonobjc class var co_defect: UIColor {
         return UIColor(hex: "#DEEAF8")
       }
    @nonobjc class var co_positive: UIColor {
         return UIColor(hex: "#F3DDA6")
       }
    @nonobjc class var co_negative: UIColor {
         return UIColor(hex: "#E9F2F1")
       }
    @nonobjc class var co_light_gray: UIColor {
      return UIColor(hex: "#161d24")
    }
}
