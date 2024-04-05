//
//  DynamicDateFormatter.swift
//  demo_app
//
//  Created by Harshit Bangar on 02/04/24.
//

import Foundation


class DynamicDateFormatter: DateFormatter {
    
    override func string(from date: Date) -> String {
        let calendar = Calendar.current
        let now = Date()
        
        if calendar.isDateInToday(date) {
            // If the date is today, format it as just the time
            self.dateFormat = "h:mm a"
        } else if calendar.isDateInYesterday(date) {
            // If the date is yesterday, display "Yesterday"
            return "Yesterday"
        } else if calendar.dateComponents([.year], from: date, to: now).year == 0 {
            // If the date is within the current year, format it as "MMM d"
            self.dateFormat = "MMM d"
        } else {
            // Otherwise, format it as "MMM d, yyyy"
            self.dateFormat = "MMM d, yyyy"
        }
        
        // Return the formatted date string
        return super.string(from: date)
    }
}
