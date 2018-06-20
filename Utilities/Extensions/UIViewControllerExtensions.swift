// UIViewControllerExtensions.swift

extension UIViewController {

    // Just call this on your viewDidLoad() and it will do the job of hiding the keyboard
    func hideKeyboardWhenTouchedOutside() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
