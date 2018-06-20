// CustomTextField.swift

class CustomTextField: UITextField {
    
    private var __maxLengths = [UITextField: Int]()
    
    // Swift does not provide a built-in max length property on text fields
    // This lets you set the max length in the Interface Builder under the Attributes inspector
    // Make sure you set the class of the textfield to CustomTextField
    @IBInspectable var maxLength: Int {
        get {
            guard let l = __maxLengths[self] else {
                return Int.max // (150 for global default-limit or use Int.max)
            }
            return l
        }
        set {
            __maxLengths[self] = newValue
            addTarget(self, action: #selector(fix), for: .editingChanged)
        }
    }
    
    @objc func fix(textField: UITextField) {
        let t = textField.text
        textField.text = t?.limitLength(maxLength)
    }

    // Add image to the left of the textfield like in Android (drawableStart)
    func addLeftImage(_ image: UIImage) {
        add(image, to: "left")
    }
    
    // Add image to the right of the textfield like in Android (drawableEnd)
    func addRightImage(_ image: UIImage) {
        add(image, to: "right")
    }
    
    private func add(_ image: UIImage, to: String) {
        let imageView = UIImageView()
        imageView.image = image
        
        let imageContent = UIView()
        imageContent.addSubview(imageView)
        imageContent.frame = CGRect(x: 0, y: 0, width: 24, height: 16)
        
        if to == "left" {
            imageView.frame = CGRect(x: 10, y: 0, width: 16, height: 16)
            
            self.leftView = imageContent
            self.leftViewMode = UITextFieldViewMode.always
        } else if to == "right" {
            imageView.frame = CGRect(x: -4, y: 0, width: 16, height: 16)
            
            self.rightView = imageContent
            self.rightViewMode = UITextFieldViewMode.always
        }
    }
}
