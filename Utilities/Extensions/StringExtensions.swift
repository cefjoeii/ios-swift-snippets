// StringExtensions.swift

import Foundation

extension String {
    
    // Replace two or more spaces with a single space
    // Remove all the spaces around the string
    func sanitized() -> String {
        return self
            .components(separatedBy: .whitespacesAndNewlines)
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func sanitizedPhone() -> String {
        return self
            .replacingOccurrences(of: "-", with: "")
            .replacingOccurrences(of: "(", with: "")
            .replacingOccurrences(of: ")", with: "")
            .replacingOccurrences(of: " ", with: "") // <-- This does not work. I'm sorry
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func convertDateFormat(from: String, to: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = from
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = to
        
        if let validDate = date { return "\(dateFormatter.string(from: validDate))" }

        return self
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                return false
            }
        } catch _ as NSError {
            return false
        }
        
        return true
    }
    
    func isNotValidEmail() -> Bool {
        return !self.isValidEmail()
    }

    // Convert a string, which is a valid date, to "time ago"
    // Usage: myDateString.toTimeAgo(ofFormat: "yyyy-MM-dd HH:mm:ss Z", isNumeric: true)
    // See: http://nsdateformatter.com/ for more awesome knowledge
    func toTimeAgo(ofFormat: String, isNumeric: Bool = false) -> String {
        
        // Convert the string into a Date first
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = ofFormat
        
        // Do the magic if the date is indeed a valid date
        if let date = dateFormatter.date(from: self) {
            let calendar = NSCalendar.current
            let unitFlags: Set<Calendar.Component> = [.year, .month, .weekOfYear, .day, .hour, .minute, .second]
            let now = Date()
            let earliest = now < date ? now : date
            let latest = (earliest == now) ? date : now
            let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
            
            if components.year! >= 2 {
                return "\(components.year!) years ago"
            } else if components.year! >= 1 {
                if isNumeric {
                    return "1 year ago"
                } else {
                    return "Last year"
                }
            } else if components.month! >= 2 {
                return "\(components.month!) months ago"
            } else if components.month! >= 1 {
                if isNumeric {
                    return "1 month ago"
                } else {
                    return "Last month"
                }
            } else if components.weekOfYear! >= 2 {
                return "\(components.weekOfYear!) weeks ago"
            } else if components.weekOfYear! >= 1 {
                if isNumeric {
                    return "1 week ago"
                } else {
                    return "Last week"
                }
            } else if components.day! >= 2 {
                return "\(components.day!) days ago"
            } else if components.day! >= 1 {
                if isNumeric {
                    return "1 day ago"
                } else {
                    return "Yesterday"
                }
            } else if components.hour! >= 2 {
                return "\(components.hour!) hours ago"
            } else if components.hour! >= 1 {
                if isNumeric {
                    return "1 hour ago"
                } else {
                    return "An hour ago"
                }
            } else if components.minute! >= 2 {
                return "\(components.minute!) minutes ago"
            } else if components.minute! >= 1 {
                if isNumeric {
                    return "1 minute ago"
                } else {
                    return "A minute ago"
                }
            } else if components.second! >= 3 {
                return "\(components.second!) seconds ago"
            } else {
                return "Just now"
            }
        }
        
        // Return its original value if it isn't a valid date
        return self
    }

    // This extension function is a depency of the CustomTextfield
    // to limit the length of the string
    func limitLength(_ n: Int) -> String {
        if self.count <= n {
            return self
        }
        return String( Array(self).prefix(upTo: n) )
    }
}
