//
//  AnimationHelper.swift
//  PlayingCards
//
//  Created by Terry Dengis on 11/16/18.
//  Copyright © 2018 Terry Dengis. All rights reserved.
//

import UIKit

class AnimationHelper {
    var lastFrame:CGRect!
    var originFrame:CGRect!
    var xLocation:CGFloat = 20.0
    var yLocation:CGFloat = 50.0
    
    var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    init (fromFrame: CGRect) {
        originFrame = fromFrame
    }
    
    func nextFrame () -> CGRect {
        let newFrame = CGRect (x: xLocation, y: yLocation, width: originFrame.width, height: originFrame.height)
        
        if xLocation >= screenBounds.maxX-20-originFrame.width {
            yLocation += originFrame.height + 20
            xLocation = 20
            
        } else {
            xLocation += 20
        }
        return newFrame
    }

}
