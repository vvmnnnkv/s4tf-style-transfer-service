/// TF-specific base64 handing

extension String {
    func base64Safe() -> String {
        self.replacingOccurrences(of: "+", with: "-").replacingOccurrences(of: "/", with: "_")
    }

    func base64Unsafe() -> String {
        self.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
    }
}

/// Random
extension String {
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

