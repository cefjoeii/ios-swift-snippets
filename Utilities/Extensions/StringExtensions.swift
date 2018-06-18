// StringExtensions.swift

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
}
