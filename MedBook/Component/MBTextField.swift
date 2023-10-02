//
//  MBTextField.swift
//  MedBook
//
//  Created by Sanju on 01/10/23.
//

import UIKit


@IBDesignable class MBTextField: UITextField {
    
    let border = CALayer()
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            setup()
        }
    }
    
    
    @IBInspectable var borderWidth: CGFloat = 0.5 {
        didSet {
            setup()
        }
    }
    
    
    override init(frame : CGRect) {
        super.init(frame : frame)
        setup()
    }
    
    
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    
    func setup() {
        border.borderColor = self.borderColor.cgColor
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return editingRect(forBounds: bounds)
    }
    
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return editingRect(forBounds: bounds)
    }
    
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 5, dy: 0)
    }
    
}
