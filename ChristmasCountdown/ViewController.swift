//
//  ViewController.swift
//  ChristmasCountdown
//
//  Created by Keli'i Martin on 12/11/16.
//  Copyright © 2016 WERUreo. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController
{
    ////////////////////////////////////////////////////////////
    // MARK: - IBOutlets
    ////////////////////////////////////////////////////////////

    @IBOutlet weak var daysLabel: UILabel!

    ////////////////////////////////////////////////////////////
    // MARK: - Properties
    ////////////////////////////////////////////////////////////

    var xmasDay: Date
    {
        let userCalendar = Calendar.current
        var components = DateComponents()
        components.year = 2016
        components.day = 25
        components.month = 12

        return userCalendar.date(from: components)!
    }

    ////////////////////////////////////////////////////////////

    var today: Date
    {
        let now = Date()
        let userCalendar = Calendar.current
        var components = DateComponents()
        components.year = userCalendar.component(.year, from: now)
        components.day = userCalendar.component(.day, from: now)
        components.month = userCalendar.component(.month, from: now)

        return userCalendar.date(from: components)!
    }

    ////////////////////////////////////////////////////////////
    // MARK: - View Controller Life Cycle
    ////////////////////////////////////////////////////////////

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let daysTillXmas = daysBetweenDates(startDate: today, endDate: xmasDay)
        daysLabel.text = "\(daysTillXmas)"

        UIApplication.shared.applicationIconBadgeNumber = daysTillXmas
    }

    ////////////////////////////////////////////////////////////

    func daysBetweenDates(startDate: Date, endDate: Date) -> Int
    {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: startDate, to: endDate)
        return components.day!
    }
}

