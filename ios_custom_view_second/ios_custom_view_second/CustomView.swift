//
//  CustomView.swift
//  ios_custom_view_second
//
//  Created by shin seunghyun on 2020/03/30.
//  Copyright © 2020 shin seunghyun. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var button: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
   
    }
    
    func commonInit() {
        let nib = UINib(nibName: "CustomView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    
}

