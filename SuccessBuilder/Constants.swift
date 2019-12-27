//
//  Constants.swift
//  SuccessBuilder
//
//  Created by Ben on 25.12.2019.
//  Copyright © 2019 Ben. All rights reserved.
//

import Foundation
import UIKit


enum ListConctollerCellMesurements {
    
     static let cellHeight: CGFloat = 70
     static let minimumSwipeCellWidth: CGFloat = 70.0
   }


enum ImageInListController {
    static let background = #imageLiteral(resourceName: "background-image")
    static let strikeOutForSwipeCell = #imageLiteral(resourceName: "strikeout-icon")
    static let reminderForSwipeCell = UIImage(named: "reminder-icon")
    static let addEventToCalendarForSwipeCell = #imageLiteral(resourceName: "calendar-icon")
    static let deleteForSwipeCell = #imageLiteral(resourceName: "trash-icon")
    static let changeTitleForSwipeCell = UIImage (named: "editTitle-icon")
}

enum Color {
    static let swipeCellBackgroundColorForDefault = UIColor (named: "swipeCellBackgroundColorForDefault")
//        .init(red: 240/255, green: 214/255, blue: 226/255, alpha: 1)
    static let swipeCellBackGroundColorForDestructive = UIColor (named: "swipeCellBackGroundColorForDestructive ")
//        .init(red: 242/255, green: 93/255, blue: 97/255, alpha: 1)
    static let separatorCustomColor = UIColor (named: "separatorCustomColor")
//        .init(red: 251/255, green: 251/255, blue: 251/255, alpha: 1)
}

enum SettingsAlert {
    static let title = NSLocalizedString("We need your permission", comment: "We need your permission")
    static let message = NSLocalizedString("Go to settings", comment: "Go to settings")
    static let settingActionTitle = NSLocalizedString("Settings", comment: "Settings")
    static let cancelActionTitle = NSLocalizedString("Cancel", comment: "Cancel")
}
