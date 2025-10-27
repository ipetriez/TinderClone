//
//  Utilities.swift
//  TinderClone
//
//  Created by Sergey Petrosyan on 27.10.25.
//

import UIKit

class Utilities {
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}
